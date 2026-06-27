package com.cws.cwslife.controller;

import com.cws.cwslife.model.Event;

import com.cws.cwslife.repository.EventRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import java.time.LocalDate;
import java.util.*;
import java.time.LocalDateTime;
import com.cws.cwslife.model.EventStats;
import com.cws.cwslife.repository.EventStatsRepository;
import com.cws.cwslife.model.ActivityLog;
import com.cws.cwslife.repository.ActivityLogRepository;

@RestController
@RequestMapping("/api/events")
@CrossOrigin(origins = "*")
public class EventController {
	@Autowired
	private ActivityLogRepository activityLogRepository;
	@Autowired
	private EventStatsRepository eventStatsRepository;
    @Autowired
    private EventRepository eventRepository;

    // ── GET ALL EVENTS ──
    // GET /api/events/all
    @GetMapping("/all")
    public ResponseEntity<?> getAllEvents() {
        return ResponseEntity.ok(eventRepository.findAll());
    }

    // ── GET UPCOMING EVENTS ──
    // GET /api/events/upcoming
    // Public page upcoming events
    @GetMapping("/upcoming")
//    public ResponseEntity<?> getUpcomingEvents() {
//        return ResponseEntity.ok(
//            eventRepository.findByStatus("UPCOMING")
//        );
//    }
    
    public ResponseEntity<?> getUpcomingEvents() {
        return ResponseEntity.ok(
            eventRepository.findByStatusOrderByEventDateAsc("UPCOMING")
        );
    }

    // ── GET PAST EVENTS ──
    // GET /api/events/past
    // Public page past events
//    @GetMapping("/past")
//    public ResponseEntity<?> getPastEvents() {
//        return ResponseEntity.ok(
//            eventRepository.findByStatus("PAST")
//        );
//    }
    
    @GetMapping("/past")
    public ResponseEntity<?> getPastEvents() {
        return ResponseEntity.ok(
            eventRepository.findByStatusOrderByEventDateDesc("PAST")
        );
    }

    // ── GET COUNT ──
    // GET /api/events/count
    // Dashboard stats card 
    @GetMapping("/count")
    public ResponseEntity<?> getCount() {
        Map<String, Long> response = new HashMap<>();
        response.put("total",    eventRepository.count());
        response.put("upcoming", eventRepository.countByStatus("UPCOMING"));
        response.put("past",     eventRepository.countByStatus("PAST"));
        
        Long updated = eventRepository.sumUpdateCount();
        response.put("updated", updated != null ? updated : 0L);
     
        // get delete count from databse
        EventStats stats = eventStatsRepository.findById(1L)
            .orElse(new EventStats());
        response.put("deleted", stats.getTotalDeleted());
        
        return ResponseEntity.ok(response);
    }

    // ── GET ONE EVENT ──
    // GET /api/events/{id}
    // detail one event
    @GetMapping("/{id}")
    public ResponseEntity<?> getEvent(@PathVariable Long id) {
        Optional<Event> event = eventRepository.findById(id);
        if (event.isPresent()) {
            return ResponseEntity.ok(event.get());
        }
        Map<String, String> error = new HashMap<>();
        error.put("message", "Event not found");
        return ResponseEntity.status(404).body(error);
    }

    // ── ADD NEW EVENT ──
    // POST /api/events/add
    //Add new event from admin panel
    @PostMapping("/add")
    public ResponseEntity<?> addEvent(
            @RequestBody Map<String, String> request) {

        String title       = request.get("title");
        String category    = request.get("category");
        String eventDate   = request.get("eventDate");
        String description = request.get("description");
        String imageUrl    = request.get("imageUrl");
        String status      = request.get("status");

        // Required fields check
        if (title == null || title.isEmpty()) {
            Map<String, String> error = new HashMap<>();
            error.put("message", "Event title is required");
            return ResponseEntity.badRequest().body(error);
        }

        if (eventDate == null || eventDate.isEmpty()) {
            Map<String, String> error = new HashMap<>();
            error.put("message", "Event date is required");
            return ResponseEntity.badRequest().body(error);
        }
        
     // Duplicate title + same year check
        String finalStatus = status != null ? status : "UPCOMING";
        LocalDate parsedDate = LocalDate.parse(eventDate);
        int newYear = parsedDate.getYear();

        boolean titleExists = eventRepository.findAll().stream()
            .anyMatch(e -> e.getTitle().equalsIgnoreCase(title.trim())
                       && e.getStatus().equalsIgnoreCase(finalStatus)
                       && e.getEventDate().getYear() == newYear);
        if (titleExists) {
            Map<String, String> error = new HashMap<>();
            error.put("message", "Event '" + title + "' already exists for year " + newYear + "!");
            return ResponseEntity.badRequest().body(error);
        }

//     // Duplicate image check compare with filename 
//        if (imageUrl != null && !imageUrl.isEmpty()) {
//            String newFileName = imageUrl.substring(imageUrl.lastIndexOf('/') + 1);
//            // timestamp_originalname.jpeg → originalname.jpeg
//            String newOriginalName = newFileName.contains("_")
//                ? newFileName.substring(newFileName.indexOf('_') + 1)
//                : newFileName;
//
//            boolean imageExists = eventRepository.findAll().stream()
//                .filter(e -> e.getImageUrl() != null && !e.getImageUrl().isEmpty())
//                .anyMatch(e -> e.getImageUrl().contains(newOriginalName));
//
//            if (imageExists) {
//                Map<String, String> error = new HashMap<>();
//                error.put("message", "This image is already used in another event. Please upload a different image!");
//                return ResponseEntity.badRequest().body(error);
//            }
//        }

        // Event object
        Event event = new Event();
        event.setTitle(title);
        event.setCategory(category);
        event.setEventDate(LocalDate.parse(eventDate));
        event.setDescription(description);
        //event.setImageUrl(imageUrl);
        String cleanImageUrl = imageUrl;
        if (imageUrl != null && imageUrl.startsWith("http")) {
            cleanImageUrl = imageUrl.substring(imageUrl.indexOf("/uploads"));
        }
        event.setImageUrl(cleanImageUrl);
        event.setStatus(status != null ? status : "UPCOMING");
        
        // Saved in Database 
        eventRepository.save(event);
        //For recnet activity tracking
        activityLogRepository.save(new ActivityLog(
        	    "New Event Added: " + title, "EVENT", "ADDED"));

        Map<String, String> response = new HashMap<>();
        response.put("message", "Event added successfully!");
        return ResponseEntity.ok(response);
    }

    // ── UPDATE EVENT ──
    // PUT /api/events/update/{id}
    // Update event from admin panel
    @PutMapping("/update/{id}")
    public ResponseEntity<?> updateEvent(
            @PathVariable Long id,
            @RequestBody Map<String, String> request) {

        Optional<Event> eventOpt = eventRepository.findById(id);

        if (!eventOpt.isPresent()) {
            Map<String, String> error = new HashMap<>();
            error.put("message", "Event not found");
            return ResponseEntity.status(404).body(error);
        }

        Event event = eventOpt.get();

        // Update fields
        if (request.get("title") != null)
            event.setTitle(request.get("title"));
        if (request.get("category") != null)
            event.setCategory(request.get("category"));
        if (request.get("eventDate") != null)
            event.setEventDate(LocalDate.parse(request.get("eventDate")));
        if (request.get("description") != null)
            event.setDescription(request.get("description"));
        if (request.get("imageUrl") != null) {
            String imgUrl = request.get("imageUrl");
            if (imgUrl.startsWith("http")) {
                imgUrl = imgUrl.substring(imgUrl.indexOf("/uploads"));
            }
            event.setImageUrl(imgUrl);
        }
        if (request.get("status") != null)
            event.setStatus(request.get("status"));

        // Save updated event
        // IMPORTANT
        event.setUpdateCount(event.getUpdateCount() + 1);
        event.setUpdatedAt(LocalDateTime.now());

        // Save updated event
        eventRepository.save(event);
         
        activityLogRepository.save(new ActivityLog(
        	    "Event Updated: " + event.getTitle(), "EVENT", "UPDATED"));
        
        Map<String, String> response = new HashMap<>();
        response.put("message", "Event updated successfully!");
        return ResponseEntity.ok(response);
    }

		 // ── DELETE EVENT ──
		 // DELETE /api/events/delete/{id}
		 // Delete event from admin panel
       
         
		 @DeleteMapping("/delete/{id}")
		 public ResponseEntity<?> deleteEvent(@PathVariable Long id) {
		
		     Optional<Event> eventOpt = eventRepository.findById(id);
		
		     if (!eventOpt.isPresent()) {
		         Map<String, String> error = new HashMap<>();
		         error.put("message", "Event not found");
		         return ResponseEntity.status(404).body(error);
		     }
		     
		     eventRepository.deleteById(id);
		     
		  // Delete count update in database
		     EventStats stats = eventStatsRepository.findById(1L)
		         .orElse(new EventStats());
		     stats.setTotalDeleted(stats.getTotalDeleted() + 1);
		     eventStatsRepository.save(stats);
		     
		     activityLogRepository.save(new ActivityLog(
		    		    "Event Deleted: " + eventOpt.get().getTitle(), "EVENT", "DELETED"));
		      
		     Map<String, String> response = new HashMap<>();
		     response.put("message", "Event deleted successfully!");
		     return ResponseEntity.ok(response);
		 }
		 // New endpoint for deleted count
		 @GetMapping("/deleted-count")
		 public ResponseEntity<?> getDeletedCount() {
		     EventStats stats = eventStatsRepository.findById(1L)
		         .orElse(new EventStats());
		     Map<String, Long> response = new HashMap<>();
		     response.put("deleted", stats.getTotalDeleted());
		     return ResponseEntity.ok(response);
		 }
		 
		// ── GET MEDIA COUNT ──
		// GET /api/events/media-count
		// count from database based on url
		@GetMapping("/media-count")
		public ResponseEntity<?> getMediaCount() {
		    long count = eventRepository.findAll().stream()
		        .filter(e -> e.getImageUrl() != null && !e.getImageUrl().isEmpty())
		        .count();

		    Map<String, Long> response = new HashMap<>();
		    response.put("mediaCount", count);
		    return ResponseEntity.ok(response);
		}
}
