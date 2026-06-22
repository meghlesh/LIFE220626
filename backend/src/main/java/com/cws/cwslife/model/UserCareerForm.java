package com.cws.cwslife.model;

import java.time.LocalDateTime;

import jakarta.persistence.*;

@Entity
public class UserCareerForm {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @Column(name="job_id")
    private Long jobId;
    private Boolean isRead = false;
    private String firstName;
    private String lastName;
    private String email;
    private String phone;

    @Column(length = 1000)
    private String message;
    private String resumeFileName;
    private LocalDateTime createdAt = LocalDateTime.now();

    // ✅ Getters & Setters

    public Long getId() {
        return id;
    }
    
    public void setId(Long id) {
		this.id = id;
	}
    
    public Boolean getIsRead() {
		return isRead;
	}

	public void setIsRead(Boolean isRead) {
		this.isRead = isRead;
	}

    public Long getJobId() {
        return jobId;
    }

    public void setJobId(Long jobId) {
        this.jobId = jobId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getMessage() {
        return message;
    }

    public void setMessage(String message) {
        this.message = message;
    }

    public String getResumeFileName() {
        return resumeFileName;
    }

    public void setResumeFileName(String resumeFileName) {
        this.resumeFileName = resumeFileName;
    }
        
    public LocalDateTime getCreatedAt() {
    		return createdAt;
    }

    public void setCreatedAt(LocalDateTime createdAt) {
    		this.createdAt = createdAt;
    }
    
}