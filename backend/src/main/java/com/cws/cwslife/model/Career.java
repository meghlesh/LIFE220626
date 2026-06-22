package com.cws.cwslife.model;

import java.time.LocalDate;

import jakarta.persistence.*;

@Entity
@Table(name = "jobs")
public class Career {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "job_id")
    private Long jobId;

    private String title;
    private String department;

    // Full-Time / Part-Time / Intern
    private String type;

    // WFO / WFH
    private String workType;
    // remote
    //private String location;

    private String experience;

    //private Integer openings;

    private String status;


    // Application count
    private Integer applicationCount = 0;

    private LocalDate postedOn = LocalDate.now();

    private LocalDate deadline;

//    @Column(length = 5000)
//    private String description;
//
//    @Column(length = 1000)
//    private String roles;
//
//    @Column(length = 5000)
//    private String responsibilities;
//
//    @Column(length = 5000)
//    private String requirements;
//
//    @Column(length = 1000)
    
    @Column(columnDefinition = "TEXT")
    private String description;

    @Column(columnDefinition = "TEXT")
    private String keySkills;

    @Column(columnDefinition = "TEXT")
    private String responsibilities;

    @Column(columnDefinition = "TEXT")
    private String requirements;

    @Column(columnDefinition = "TEXT")

    private String education;
    
    
    
    
    // getters setters
	public Long getJobId() {
		return jobId;
	}

	public void setJobId(Long jobId) {
		this.jobId = jobId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDepartment() {
		return department;
	}

	public void setDepartment(String department) {
		this.department = department;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getWorkType() {
		return workType;
	}

	public void setWorkType(String workType) {
		this.workType = workType;
	}

//	public String getLocation() {
//		return location;
//	}
//
//	public void setLocation(String location) {
//		this.location = location;
//	}

	public String getExperience() {
		return experience;
	}

	public void setExperience(String experience) {
		this.experience = experience;
	}

//	public Integer getOpenings() {
//		return openings;
//	}
//
//	public void setOpenings(Integer openings) {
//		this.openings = openings;
//	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Integer getApplicationCount() {
		return applicationCount;
	}

	public void setApplicationCount(Integer applicationCount) {
		this.applicationCount = applicationCount;
	}

	public LocalDate getPostedOn() {
		return postedOn;
	}

	public void setPostedOn(LocalDate postedOn) {
		this.postedOn = postedOn;
	}

	public LocalDate getDeadline() {
		return deadline;
	}

	public void setDeadline(LocalDate deadline) {
		this.deadline = deadline;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getKeySkills() {
		return keySkills;
	}

	public void setKeySkills(String keySkills) {
		this.keySkills = keySkills;
	}

	public String getResponsibilities() {
		return responsibilities;
	}

	public void setResponsibilities(String responsibilities) {
		this.responsibilities = responsibilities;
	}

	public String getRequirements() {
		return requirements;
	}

	public void setRequirements(String requirements) {
		this.requirements = requirements;
	}

	public String getEducation() {
		return education;
	}

	public void setEducation(String education) {
		this.education = education;
	}

    
}