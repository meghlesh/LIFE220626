package com.cws.cwslife.controller;

import com.cws.cwslife.model.AdminDashboard;

import com.cws.cwslife.model.ActivityLog;
import com.cws.cwslife.repository.ActivityLogRepository;
import com.cws.cwslife.model.Event;
import com.cws.cwslife.model.RecentActivity;
import com.cws.cwslife.repository.EventRepository;
import com.cws.cwslife.repository.GalleryRepository;
import com.cws.cwslife.repository.SocialContributionRepository;
import com.cws.cwslife.repository.SocialGalleryRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.time.Duration;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/admin/dashboard")
@CrossOrigin("*")
public class AdminDashboardController {
	@Autowired
    private ActivityLogRepository activityLogRepository;

	@Autowired
	private EventRepository eventRepository;

	@Autowired
	private SocialGalleryRepository socialGalleryRepository;

	@Autowired
	private GalleryRepository galleryRepository;

	@Autowired
	private SocialContributionRepository socialContributionRepository;

//    @GetMapping("/media-count")
//    public AdminDashboard getMediaUploadsCount() {
//
//        long mediaCount = galleryRepository.count();
//
//        return new AdminDashboard(mediaCount);
//    }
	@GetMapping("/media-count")
    public ResponseEntity<?> getMediaCount() {

        long eventCount = eventRepository.count();

        long socialCount = socialGalleryRepository.count();

        long galleryCount = galleryRepository.count();

        long contributionCount = socialContributionRepository.count();

        long totalMedia =
                eventCount +
                socialCount +
                galleryCount +
                contributionCount;

        Map<String, Long> response = new HashMap<>();

        response.put("events", eventCount);
        response.put("socialGallery", socialCount);
        response.put("gallery", galleryCount);
        response.put("socialContribution", contributionCount);
        response.put("total", totalMedia);

        return ResponseEntity.ok(response);
    }

    // =============================
    // Recent Activity API
    // =============================
    @GetMapping("/recent-activities")
    public List<RecentActivity> getRecentActivities() {
        List<ActivityLog> logs = activityLogRepository.findAllByOrderByCreatedAtDesc();
        List<RecentActivity> activities = new ArrayList<>();

        for (ActivityLog log : logs) {
            activities.add(new RecentActivity(
                log.getMessage(),
                formatTimeAgo(log.getCreatedAt()),
                log.getCreatedBy()
            ));
        }
        return activities;
    }

    // =============================
    private String formatTimeAgo(LocalDateTime createdAt) {
        Duration duration = Duration.between(createdAt, LocalDateTime.now());
        long minutes = duration.toMinutes();
        long hours = duration.toHours();
        long days = duration.toDays();

        if (minutes < 60) {
            return minutes + " mins ago";
        }
        if (hours < 24) {
            return hours + " hours ago";
        }
        return days + " days ago";
    }
}