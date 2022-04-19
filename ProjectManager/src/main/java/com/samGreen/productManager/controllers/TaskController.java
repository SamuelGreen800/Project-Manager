package com.samGreen.productManager.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.samGreen.productManager.models.Project;
import com.samGreen.productManager.models.Task;
import com.samGreen.productManager.services.ProjectService;
import com.samGreen.productManager.services.TaskService;
import com.samGreen.productManager.services.UserService;

@Controller

public class TaskController {
	@Autowired
	private UserService userService;
	@Autowired
	private ProjectService projectService;
	@Autowired
	private TaskService taskService;

	
	@GetMapping("/projects/{id}/tasks")
	public String viewTasks(@PathVariable("id") Long id, HttpSession session, Model model, @ModelAttribute("task") Task task) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		
		Project project = projectService.findById(id);
		model.addAttribute("project", project);
		model.addAttribute("tasks", taskService.projectTasks(id));
		return "tasks.jsp";
	}
	
	@PostMapping("/projects/{id}/tasks")
	public String newTask(
			@PathVariable("id") Long id, 
			HttpSession session, 
			Model model, 
			@Valid @ModelAttribute("task") Task task, 
			BindingResult result) {
		
		if(session.getAttribute("userId") == null) {
			return "redirect:/logout";
		}
		Long userId = (Long) session.getAttribute("userId");
		
		Project project = projectService.findById(id);
		
		if(result.hasErrors()) {
			model.addAttribute("project", project);
			model.addAttribute("tasks", taskService.projectTasks(id));
			return "tasks.jsp";
		}else {
			Task newTask = new Task(task.getTaskName());
			newTask.setProject(project);
			newTask.setCreator(userService.findById(userId));
			taskService.addTask(newTask);
			return "redirect:/projects/" + id + "/tasks";
		}
	}
	
}
