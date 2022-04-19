package com.samGreen.productManager.models;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.validation.constraints.Future;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="projects")


public class Project {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotEmpty(message="Project title is required!")
    @Size(min=3, max=128, message="Username must be between 3 and 30 characters")
    private String title;
    
    @NotEmpty(message="Please enter a description!")
    private String description;
    
    @NotNull(message="Please enter a date")
    @DateTimeFormat(pattern="yyyy-MM-dd")
    @Future(message="Invalid due date")
    private Date dueDate;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name="project_id")
    private User lead;
    
    @ManyToMany()
	@JoinTable(
			name = "users_projects",
			joinColumns = @JoinColumn(name = "project_id", insertable=false, updatable=false),
			inverseJoinColumns = @JoinColumn(name = "user_id", insertable=false, updatable=false)
	)
    private List<User> users;
    
    @Column(updatable=false)
    @OneToMany(mappedBy="project", fetch=FetchType.LAZY)
    private List<Task> tasks;
    
    @Column(updatable=false)
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date createdAt;
    
    
	@DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date updatedAt;
	
	  @PrePersist
		protected void onCreate(){
			this.createdAt = new Date();
		}
	    
		@PreUpdate
		protected void onUpdate(){
			this.updatedAt = new Date();
		}
	  
	    public Project() {}
	    
	    public Project(String title, Date dueDate, String description, User lead) {
	    	this.title = title;
	    	this.dueDate = dueDate;
	    	this.description = description;
	    	this.lead = lead;
	    }

	    
	    //----------------------------------------------Getters/Settters---------------------------------------------------------------
	    
	    
		public User getLead() {
			return lead;
		}

		public void setLead(User lead) {
			this.lead = lead;
		}

		public List<User> getUsers() {
			return users;
		}

		public void setUsers(List<User> users) {
			this.users = users;
		}

		public List<Task> getTasks() {
			return tasks;
		}

		public void setTasks(List<Task> tasks) {
			this.tasks = tasks;
		}

		public Long getId() {
			return id;
		}

		public void setId(Long id) {
			this.id = id;
		}

		public String getTitle() {
			return title;
		}

		public void setTitle(String title) {
			this.title = title;
		}

		public String getDescription() {
			return description;
		}

		public void setDescription(String description) {
			this.description = description;
		}

		public Date getDueDate() {
			return dueDate;
		}

		public void setDueDate(Date dueDate) {
			this.dueDate = dueDate;
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
	
	
	
}
