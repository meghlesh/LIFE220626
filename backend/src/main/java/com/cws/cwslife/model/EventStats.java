package com.cws.cwslife.model;

import jakarta.persistence.*;

@Entity
@Table(name = "event_stats")
public class EventStats {

    @Id
    private Long id = 1L; // Single row 

    private long totalDeleted = 0;

    public Long getId() { return id; }
    public long getTotalDeleted() { return totalDeleted; }
    public void setTotalDeleted(long v) { this.totalDeleted = v; }
}