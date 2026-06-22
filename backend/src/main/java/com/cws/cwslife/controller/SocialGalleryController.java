package com.cws.cwslife.controller;

import com.cws.cwslife.model.SocialGallery;

import com.cws.cwslife.repository.SocialGalleryRepository;

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
@RequestMapping("/api/social")
@CrossOrigin("*")
public class SocialGalleryController {
	@Autowired
	private ActivityLogRepository activityLogRepository;

    @Autowired
    private SocialGalleryRepository repository;

    private final String UPLOAD_DIR =
            System.getProperty("user.dir") + "/uploads/";

    // =========================
    // ADD IMAGE (CREATE)
    // =========================
    @PostMapping("/upload")
    public ResponseEntity<?> uploadImage(
            @RequestParam("title") String title,
            @RequestParam("image") MultipartFile file
    ) throws IOException {
    	
    	 // Check duplicate title
        if (repository.findByTitle(title).isPresent()) {
            return ResponseEntity
                    .badRequest()
                    .body("Please enter a valid title. Title already exists.");
        }
        String originalFileName = file.getOriginalFilename();

        System.out.println("Uploaded File = " + originalFileName);

        List<SocialGallery> galleries = repository.findAll();

        for (SocialGallery g : galleries) {

            System.out.println("DB Image URL = " + g.getImageUrl());

            if (g.getImageUrl() != null &&
                    g.getImageUrl().contains(originalFileName)) {

                System.out.println("DUPLICATE FOUND");

                return ResponseEntity
                        .badRequest()
                        .body("This imeage is already exist in social gallery");
            }
        }

        File folder = new File(UPLOAD_DIR);
        if (!folder.exists()) {
            folder.mkdirs();
        }

        String fileName = System.currentTimeMillis() + "_" + file.getOriginalFilename();
        String filePath = UPLOAD_DIR + fileName;

        file.transferTo(new File(filePath));

        SocialGallery gallery = new SocialGallery();
        gallery.setTitle(title);
        gallery.setImageUrl("/uploads/" + fileName);

        repository.save(gallery);
        //For tracking recent activity
        activityLogRepository.save(new ActivityLog(
        	    "Social Gallery Added: " + title, "SOCIAL_GALLERY", "ADDED"));

        return ResponseEntity.ok("Image Uploaded Successfully");
    }
   
    // =========================
    // GET ALL IMAGES
    // =========================
    @GetMapping("/getAll")
    public List<SocialGallery> getAllImages() {
        return repository.findAll();
    }

    // =========================
    // UPDATE BY TITLE
    // =========================
 // =========================
 // UPDATE BY TITLE
 // =========================
 @PutMapping("/updateByTitle")
 public ResponseEntity<?> updateByTitle(

         @RequestParam("title")
         String title,

         @RequestParam("newTitle")
         String newTitle,

         @RequestParam(value = "image", required = false)
         MultipartFile file

 ) throws IOException {

     SocialGallery gallery =
             repository.findByTitle(title)
                     .orElse(null);

     if (gallery == null) {
         return ResponseEntity
                 .badRequest()
                 .body("Title not found");
     }

     // Update title
     if (newTitle != null &&
             !newTitle.trim().isEmpty()) {

         gallery.setTitle(newTitle);
     }

     // Update image only if new image selected
     if (file != null &&
             !file.isEmpty()) {

         // Delete old image
         String oldPath =
                 System.getProperty("user.dir")
                         + gallery.getImageUrl();

         File oldFile =
                 new File(oldPath);

         if (oldFile.exists()) {
             oldFile.delete();
         }

         // Upload new image
         String fileName =
                 System.currentTimeMillis()
                         + "_"
                         + file.getOriginalFilename();

         String filePath =
                 UPLOAD_DIR + fileName;

         file.transferTo(
                 new File(filePath)
         );

         gallery.setImageUrl(
                 "/uploads/" + fileName
         );
     }

     repository.save(gallery);
     // For recent Activity code
     activityLogRepository.save(new ActivityLog(
    		    "Social Gallery Updated: " + newTitle, "SOCIAL_GALLERY", "UPDATED"));

     return ResponseEntity.ok(
             "Updated Successfully"
     );
 }
    // =========================
    // DELETE BY TITLE
    // =========================
    @DeleteMapping("/deleteByTitle/{title}")
    public ResponseEntity<?> deleteByTitle(@PathVariable String title) {

        SocialGallery gallery = repository.findByTitle(title).orElse(null);

        if (gallery == null) {
            return ResponseEntity
                    .badRequest()
                    .body("Title not found");
        }

        // delete file from folder
        String path = System.getProperty("user.dir") + gallery.getImageUrl();
        File file = new File(path);
        if (file.exists()) {
            file.delete();
        }

        repository.delete(gallery);
        // For recent Activity Code
        activityLogRepository.save(new ActivityLog(
        	    "Social Gallery Deleted: " + title, "SOCIAL_GALLERY", "DELETED"));

        return ResponseEntity.ok("Deleted Successfully");
    }
}