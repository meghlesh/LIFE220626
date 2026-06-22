package com.cws.cwslife.controller;

import com.cws.cwslife.model.SocialContribution;

import com.cws.cwslife.repository.SocialContributionRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import com.cws.cwslife.model.ActivityLog;
import com.cws.cwslife.repository.ActivityLogRepository;

import java.io.File;
import java.io.IOException;
import java.util.List;


@RestController
@RequestMapping("/api/contribution")
@CrossOrigin("*")
public class SocialContributionController {
	@Autowired
	private ActivityLogRepository activityLogRepository;

    @Autowired
    private SocialContributionRepository repository;

    private final String UPLOAD_DIR =
            System.getProperty("user.dir") + "/uploads/";

    // =========================
    // ADD CONTRIBUTION (FIXED)
    // =========================
    @PostMapping("/add")
    public ResponseEntity<?> addContribution(

            @RequestParam("title") String title,
            @RequestParam(value = "description", required = false, defaultValue = "") String description,
            @RequestParam(value = "pageLink", required = false, defaultValue = "#") String pageLink,
            @RequestParam("image") MultipartFile file

    ) throws IOException {
    	
    	// Check duplicate title
//    	if (repository.findByTitle(title).isPresent()) {
//    	    return ResponseEntity
//    	            .badRequest()
//    	            .body("Please enter a valid title. Title already exists.");
//    	}
    	
    	String originalFileName = file.getOriginalFilename();

    	List<SocialContribution> contributions = repository.findAll();

    	for (SocialContribution c : contributions) {

    	    if (c.getImageUrl() != null &&
    	            c.getImageUrl().contains(originalFileName)) {

    	        return ResponseEntity
    	                .badRequest()
    	                .body("Duplicate image not allowed");
    	    }
    	}

        // create folder if not exists
        File folder = new File(UPLOAD_DIR);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        // save file
//        String fileName =
//                System.currentTimeMillis()
//                + "_"
//                + file.getOriginalFilename();
        String fileName =
                System.currentTimeMillis()
                + "_"
                + originalFileName;

        String filePath = UPLOAD_DIR + fileName;

        file.transferTo(new File(filePath));

        // save DB record
        SocialContribution contribution = new SocialContribution(
                title,
                description,
                "/uploads/" + fileName,
                pageLink
        );

        SocialContribution saved = repository.save(contribution);
        //For trcaking recent activity
        activityLogRepository.save(new ActivityLog(
        	    "Social Contribution Added: " + title, "SOCIAL_CONTRIBUTION", "ADDED"));

        return ResponseEntity.ok(saved);
    }

    // =========================
    // GET ALL CONTRIBUTIONS
    // =========================
    @GetMapping("/getAll")
    public List<SocialContribution> getAll() {
        return repository.findAll();
    }

    // =========================
    // UPDATE BY TITLE
    // =========================
 
 @PutMapping("/updateByTitle")
 public ResponseEntity<?> updateContribution(

         @RequestParam("title")
         String title,

         @RequestParam(value = "newTitle", required = false)
         String newTitle,

         @RequestParam(value = "description", required = false)
         String description,

         @RequestParam(value = "pageLink", required = false)
         String pageLink,

         @RequestParam(value = "image", required = false)
         MultipartFile file

 ) throws IOException {

     SocialContribution contribution =
             repository.findByTitle(title)
                     .orElse(null);

     if (contribution == null) {
         return ResponseEntity
                 .badRequest()
                 .body("Title Not Found");
     }

     // Update title
     if (newTitle != null &&
             !newTitle.trim().isEmpty()) {

         contribution.setTitle(newTitle);
     }

     // Update description
     if (description != null) {
         contribution.setDescription(description);
     }

     // Update page link
  // Update page link
     if (pageLink != null &&
             !pageLink.trim().isEmpty()) {

         contribution.setPageLink(pageLink);
     }
     // Update image only if selected
     if (file != null &&
             !file.isEmpty()) {

         String oldPath =
                 System.getProperty("user.dir")
                         + contribution.getImageUrl();

         File oldFile = new File(oldPath);

         if (oldFile.exists()) {
             oldFile.delete();
         }

         String fileName =
                 System.currentTimeMillis()
                         + "_"
                         + file.getOriginalFilename();

         String filePath =
                 UPLOAD_DIR + fileName;

         file.transferTo(
                 new File(filePath)
         );

         contribution.setImageUrl(
                 "/uploads/" + fileName
         );
     }

     repository.save(contribution);
     //For recent activity tracking
     
     activityLogRepository.save(new ActivityLog(
    		    "Social Contribution Updated: " + title, "SOCIAL_CONTRIBUTION", "UPDATED"));

     return ResponseEntity.ok(
             "Updated Successfully"
     );
 }
    // =========================
    // DELETE BY TITLE
    // =========================
    @DeleteMapping("/deleteByTitle/{title}")
    public ResponseEntity<?> deleteContribution(@PathVariable String title) {

        SocialContribution contribution =
                repository.findByTitle(title).orElse(null);

        if (contribution == null) {
            return ResponseEntity.badRequest().body("Not Found");
        }

        // delete image
        String imagePath =
                System.getProperty("user.dir") + contribution.getImageUrl();

        File file = new File(imagePath);
        if (file.exists()) {
            file.delete();
        }

        repository.delete(contribution);
        //For recnet activity tracking
        activityLogRepository.save(new ActivityLog(
        	    "Social Contribution Deleted: " + title, "SOCIAL_CONTRIBUTION", "DELETED"));

        return ResponseEntity.ok("Deleted Successfully");
    }
}