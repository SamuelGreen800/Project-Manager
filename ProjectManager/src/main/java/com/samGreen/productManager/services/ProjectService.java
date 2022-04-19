package com.samGreen.productManager.services;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.samGreen.productManager.models.Project;
import com.samGreen.productManager.models.User;
import com.samGreen.productManager.repositories.ProjectRepository;

@Service
public class ProjectService {
	@Autowired 
	private ProjectRepository projectRepo;
	
	public ProjectService(ProjectRepository projectRepo) {
		this.projectRepo = projectRepo;
	}
	
	public List<Project> allProjects(){
		return projectRepo.findAll();
	}
	
	public Project updateProject(Project project) {
		return projectRepo.save(project);
	}
	
	public List<Project> getAssignedUsers(User user){
		return projectRepo.findAllByUsers(user);
	}
	
	public List<Project> getUnassignedUsers(User user){
		return projectRepo.findByUsersNotContains(user);
	}
	
	public Project addProject(Project project) {
		return projectRepo.save(project);
	}
	
	public void deleteProject(Project project) {
		projectRepo.delete(project);
	}
	
	public Project findById(Long id) {
		Optional<Project> optionalProject = projectRepo.findById(id);
		if(optionalProject.isPresent()) {
			return optionalProject.get();
		}else {
			return null;
		}
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	public ProjectRepository getProjectRepo() {
		return projectRepo;
	}

	public void setProjectRepo(ProjectRepository projectRepo) {
		this.projectRepo = projectRepo;
	}

}
