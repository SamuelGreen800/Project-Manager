package com.samGreen.productManager.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
@Entity
@Table(name="tasks")

public class Task {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty(message="Project title is required!")
    @Size(min=3, max=128, message="Username must be between 3 and 30 characters")
    private String taskName;
    
    @Column(updatable=false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;
    

	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;
	
	@ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="user_id",insertable=false, updatable=false)
	private User creator;
	

	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name="project_id")
	private Project project;
	
	  @PrePersist
		protected void onCreate(){
			this.createdAt = new Date();
		}
	    
		@PreUpdate
		protected void onUpdate(){
			this.updatedAt = new Date();
		}
		
		public Task() {}
		
		public Task(String taskName) {
			this.taskName = taskName;
		}
		//--------------------------------------------------------------Getters/Setters-----------------------------------[

		public Long getTaskId() {
			return id;
		}

		public String getTaskName() {
			return taskName;
		}

		public void setTaskName(String taskName) {
			this.taskName = taskName;
		}

		public void setTaskId(Long taskId) {
			this.id = taskId;
		}

		

		public Date getCreatedAt() {
			return createdAt;
		}

		public void setCreatedAt(Date createdAt) {
			this.createdAt = createdAt;
		}

		public Date getUpdatedAt() {
			return updatedAt;
		}

		public void setUpdatedAt(Date updatedAt) {
			this.updatedAt = updatedAt;
		}

		
		
		
		public Long getId() {
			return id;
		}
		
		public void setId(Long id) {
			this.id = id;
		}
		
		public User getCreator() {
			return creator;
		}
		
		public void setCreator(User creator) {
			this.creator = creator;
		}
		
		public Project getProject() {
			return project;
		}
		
		public void setProject(Project project) {
			this.project = project;
		}
}
