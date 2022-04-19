package com.samGreen.productManager.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.samGreen.productManager.models.Task;
import com.samGreen.productManager.repositories.TaskRepository;

@Service

public class TaskService {
	@Autowired
	private TaskRepository taskRepo;
	
	public List<Task> allTasks(){
		return taskRepo.findAll();
	}
	
	public List<Task> projectTasks(Long projectId){
		return taskRepo.findByProjectIdIs(projectId);
	}
	
	public Task addTask(Task task) {
		return taskRepo.save(task);
	}
	
	public void deleteTask(Task task) {
		taskRepo.delete(task);
	}
	

	
	
	
	
	//----------------------------------------------------
	
	
	
	
	public TaskRepository getTaskRepo() {
		return taskRepo;
	}
	
	public void setTaskRepo(TaskRepository taskRepo) {
		this.taskRepo = taskRepo;
	}
}
