package com.cws.cwslife.controller;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import java.io.*;
import java.nio.file.*;
import java.util.*;

@RestController
@RequestMapping("/api/upload")
@CrossOrigin(origins = "*")
public class FileUploadController {

    
//    @Value("${app.upload.dir}")
//    private String uploadDir;
	
	// path 
    private final String uploadDir = 
        System.getProperty("user.dir") + "/uploads/events/";

    // POST /api/upload/image
    // URL return 
    @PostMapping("/image")
    public ResponseEntity<?> uploadImage(
            @RequestParam("file") MultipartFile file) {

        // File empty check
        if (file.isEmpty()) {
            Map<String, String> error = new HashMap<>();
            error.put("message", "Please select a file");
            return ResponseEntity.badRequest().body(error);
        }

        // File type check —  images allow
        String contentType = file.getContentType();
        if (contentType == null ||
            !contentType.startsWith("image/")) {
            Map<String, String> error = new HashMap<>();
            error.put("message", "Only image files are allowed");
            return ResponseEntity.badRequest().body(error);
        }

        try {
            // Upload folder 
            Path uploadPath = Paths.get(uploadDir);
            if (!Files.exists(uploadPath)) {
                Files.createDirectories(uploadPath);
            }

            String originalName = file.getOriginalFilename();

//         // Duplicate file check same original filename already exist or not 
//         Path uploadPath2 = Paths.get(uploadDir);
//         File folder = uploadPath2.toFile();
//         if (folder.exists() && folder.isDirectory()) {
//             for (File existingFile : folder.listFiles()) {
//                 if (existingFile.getName().endsWith("_" + originalName)) {
//                     Map<String, String> error = new HashMap<>();
//                     error.put("message", "This image is already uploaded. Please use a different image!");
//                     return ResponseEntity.badRequest().body(error);
//                 }
//             }
//         }

         
         String fileName = System.currentTimeMillis() + "_" + originalName;

            // File save 
            Path filePath = uploadPath.resolve(fileName);
            Files.copy(file.getInputStream(), filePath,
                StandardCopyOption.REPLACE_EXISTING);

            // URL return 
            String fileUrl = "/uploads/events/" + fileName;

            Map<String, String> response = new HashMap<>();
            response.put("message", "Image uploaded successfully!");
            response.put("url",     fileUrl);
            response.put("fileName", fileName);

            return ResponseEntity.ok(response);

        } catch (Exception e) {                              //  IOException se Exception
            Map<String, String> error = new HashMap<>();
            error.put("message", "Failed to upload image: " + e.getMessage());
            error.put("errorType", e.getClass().getName()); //  exact error type
            error.put("uploadDir", uploadDir);              //  path check
            return ResponseEntity.status(500).body(error);
        }
    }
}
