package com.cws.cwslife.model;

import jakarta.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "activity_log")
public class ActivityLog {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String message;
    private String module; // EVENT, GALLERY, SOCIAL_GALLERY, SOCIAL_CONTRIBUTION
    private String action; // ADDED, UPDATED, DELETED
    private String createdBy = "Admin";
    private LocalDateTime createdAt = LocalDateTime.now();

    public ActivityLog() {}

    public ActivityLog(String message, String module, String action) {
        this.message = message;
        this.module = module;
        this.action = action;
        this.createdAt = LocalDateTime.now();
    }

    public Long getId() { return id; }
    public String getMessage() { return message; }
    public String getModule() { return module; }
    public String getAction() { return action; }
    public String getCreatedBy() { return createdBy; }
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setMessage(String v) { this.message = v; }
    public void setModule(String v) { this.module = v; }
    public void setAction(String v) { this.action = v; }
    public void setCreatedBy(String v) { this.createdBy = v; }
    public void setCreatedAt(LocalDateTime v) { this.createdAt = v; }
}