package com.cws.cwslife.model;

import jakarta.persistence.*;
import java.util.Date;

@Entity
public class Gallery {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    // ✅ Image Path
    private String smallImagePath;
    private String mediumImagePath;
    private String largeImagePath;

    // ✅ Category
    @Enumerated(EnumType.STRING)
    private GalleryCategory category;

    // ✅ Title
    private String title;

    // ✅ Upload Date
    @Temporal(TemporalType.TIMESTAMP)
    private Date uploadDate;

    // ✅ Auto upload date
    @PrePersist
    protected void onCreate() {
        this.uploadDate = new Date();
    }

    // =========================
    // GETTERS & SETTERS
    // =========================

    public Long getId() {
        return id;
    }

    // Small Image
    public String getSmallImagePath() {
        return smallImagePath;
    }

    public void setSmallImagePath(String smallImagePath) {
        this.smallImagePath = smallImagePath;
    }
    
 // Medium Image
    public String getMediumImagePath() {
        return mediumImagePath;
    }

    public void setMediumImagePath(String mediumImagePath) {
        this.mediumImagePath = mediumImagePath;
    }

    // Large Image
    public String getLargeImagePath() {
        return largeImagePath;
    }

    public void setLargeImagePath(String largeImagePath) {
        this.largeImagePath = largeImagePath;
    }

    public GalleryCategory getCategory() {
        return category;
    }

    public void setCategory(GalleryCategory category) {
        this.category = category;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public Date getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }
}