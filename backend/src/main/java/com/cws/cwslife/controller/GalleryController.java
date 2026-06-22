package com.cws.cwslife.controller;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;

import com.cws.cwslife.model.Gallery;
import com.cws.cwslife.model.GalleryCategory;
import com.cws.cwslife.repository.GalleryRepository;
import com.cws.cwslife.util.ImageCompressionUtil;
import com.cws.cwslife.model.ActivityLog;
import com.cws.cwslife.repository.ActivityLogRepository;

@RestController
@RequestMapping("/api/gallery")
@CrossOrigin(origins = "*")
public class GalleryController {
	@Autowired
	private ActivityLogRepository activityLogRepository;
    @Autowired
    private GalleryRepository galleryRepository;

    // ✅ ADD IMAGE
    @PostMapping("/add")
    public ResponseEntity<?> addImage(

    		@RequestParam(value = "image", required = false) MultipartFile file,

    		@RequestParam(value = "category", required = false) String category,

            @RequestParam("title") String title
    ) {
    	
        try {
        	// Category validation
        	if(category == null || category.trim().isEmpty()){

        	    return ResponseEntity.badRequest()
        	            .body("Please select category ❌");
        	}
        	GalleryCategory galleryCategory;

        	try {

        	    galleryCategory = GalleryCategory.valueOf(category);

        	} catch (IllegalArgumentException e) {

        	    return ResponseEntity.badRequest()
        	            .body("Invalid category ❌");
        	}

        	// Title validation
        	if (title == null || title.trim().isEmpty()) {

        	    return ResponseEntity.badRequest()
        	            .body("Please enter title ❌");
        	}

            //File Validation
            if (file == null || file.isEmpty()) {

                return ResponseEntity.badRequest()
                        .body("File is required ❌");
            }

            // ✅ File type
            String contentType = file.getContentType();

            boolean isImage =
                    contentType.equals("image/jpeg") ||
                    contentType.equals("image/jpg")  ||
                    contentType.equals("image/png");

            boolean isVideo =
                    contentType.equals("video/mp4") ||
                    contentType.equals("video/quicktime");

            // ✅ CWS_VIDEO category → only video
            if (galleryCategory == GalleryCategory.CWS_VIDEO){

                if (!isVideo) {

                    return ResponseEntity.badRequest()
                            .body("Only videos allowed in CWS_VIDEO ❌");
                }

                
            } else {

                // ✅ Other categories → only image
                if (!isImage) {

                    return ResponseEntity.badRequest()
                            .body("Only JPG/JPEG/PNG allowed ❌");
                }


                // ✅ Image max 25MB
                if (file.getSize() > 25 * 1024 * 1024) {

                    return ResponseEntity.badRequest()
                            .body("Image max 5MB is allowed ❌");
                }

            }

            // 📁 Upload folder
            String uploadDir =
                    System.getProperty("user.dir")
                    + File.separator
                    + "gallery";

            File dir = new File(uploadDir);
           
            if (!dir.exists()) {
                dir.mkdirs();
            }

            // 📄 Unique filename
            String fileName =
                    System.currentTimeMillis()
                    + "_"
                    + file.getOriginalFilename();

            // 📂 Full path
            Path filePath = Paths.get(uploadDir, fileName);

            // 💾 Save file
            File uploadedFile = filePath.toFile();
            file.transferTo(uploadedFile);

            String smallPath = null;
            String mediumPath = null;
            String largePath = null;

            if(isImage) {

                String smallFileName = "small_" + fileName;
                String mediumFileName = "medium_" + fileName;
                String largeFileName = "large_" + fileName;

                File smallFile =
                        new File(uploadDir + File.separator + smallFileName);

                File mediumFile =
                        new File(uploadDir + File.separator + mediumFileName);

                File largeFile =
                        new File(uploadDir + File.separator + largeFileName);

                ImageCompressionUtil.compressSmall(
                        uploadedFile,
                        smallFile
                );

                ImageCompressionUtil.compressMedium(
                        uploadedFile,
                        mediumFile
                );

                ImageCompressionUtil.compressLarge(
                        uploadedFile,
                        largeFile
                );

                smallPath = "/gallery/" + smallFileName;
                mediumPath = "/gallery/" + mediumFileName;
                largePath = "/gallery/" + largeFileName;
            }

            // 💾 Save in DB
            Gallery g = new Gallery();

            if(isImage) {

                g.setSmallImagePath(smallPath);
                g.setMediumImagePath(mediumPath);
                g.setLargeImagePath(largePath);

            } else {

                g.setLargeImagePath("/gallery/" + fileName);
            }

            g.setCategory(galleryCategory);

            g.setTitle(title);

            galleryRepository.save(g);
            //for recent activity code
            activityLogRepository.save(new ActivityLog(
            	    "Gallery Image Added: " + title, "GALLERY", "ADDED"));

            // ✅ Success message
            if (galleryCategory == GalleryCategory.CWS_VIDEO) {

                return ResponseEntity.ok(
                        "Video uploaded successfully ✅");

            } else {

                return ResponseEntity.ok(
                        "Image uploaded successfully ✅");
            }

        } catch (Exception e) {

            e.printStackTrace();

            return ResponseEntity.badRequest()
                    .body("Error uploading image ❌");
        }
    }
    
    
    
    // UPDATE API
    @PutMapping("/update/{id}")
    public ResponseEntity<?> updateImage(

            @PathVariable Long id,

            @RequestParam(value = "image", required = false)
            MultipartFile file,

            @RequestParam("category")
            String category,

            @RequestParam("title")
            String title
    ) {

        try {

            Optional<Gallery> optional = galleryRepository.findById(id);

            if(optional.isEmpty()) {

                return ResponseEntity.badRequest().body("Gallery item not found ❌");
            }

            Gallery gallery = optional.get();

            GalleryCategory galleryCategory = GalleryCategory.valueOf(category);

            gallery.setCategory(galleryCategory);
            gallery.setTitle(title);

            // Agar nayi file upload ki hai tabhi replace karo
            if(file != null && !file.isEmpty()) {

                // Purani files delete karo
                String[] oldPaths = {
                        gallery.getSmallImagePath(),
                        gallery.getMediumImagePath(),
                        gallery.getLargeImagePath()
                };

                for(String imagePath : oldPaths) {

                    if(imagePath != null) {

                        String fileName = imagePath.replace("/gallery/", "");

                        String filePath =
                                System.getProperty("user.dir")
                                + File.separator
                                + "gallery"
                                + File.separator
                                + fileName;

                        File oldFile = new File(filePath);

                        if(oldFile.exists()) {
                            oldFile.delete();
                        }
                    }
                }

                // Nayi file save karo
                String uploadDir =
                        System.getProperty("user.dir")
                        + File.separator
                        + "gallery";

                String fileName =
                        System.currentTimeMillis()
                        + "_"
                        + file.getOriginalFilename();

                Path filePath = Paths.get(uploadDir, fileName);

                File uploadedFile = filePath.toFile();

                file.transferTo(uploadedFile);

                boolean isImage = file.getContentType().startsWith("image");

                if(isImage) {

                    String smallFileName = "small_" + fileName;

                    String mediumFileName = "medium_" + fileName;

                    String largeFileName = "large_" + fileName;

                    File smallFile = new File(uploadDir + File.separator + smallFileName);

                    File mediumFile = new File(uploadDir + File.separator + mediumFileName);

                    File largeFile = new File(uploadDir + File.separator + largeFileName);

                    ImageCompressionUtil.compressSmall(uploadedFile, smallFile);

                    ImageCompressionUtil.compressMedium(uploadedFile, mediumFile);

                    ImageCompressionUtil.compressLarge(uploadedFile, largeFile);

                    gallery.setSmallImagePath("/gallery/" + smallFileName);

                    gallery.setMediumImagePath("/gallery/" + mediumFileName);

                    gallery.setLargeImagePath("/gallery/" + largeFileName);

                } else {

                    gallery.setSmallImagePath(null);
                    gallery.setMediumImagePath(null);

                    gallery.setLargeImagePath(
                            "/gallery/" + fileName);
                }
            }

            galleryRepository.save(gallery);
            //For recent activity 
            activityLogRepository.save(new ActivityLog(
            	    "Gallery Image Updated: " + title, "GALLERY", "UPDATED"));

            return ResponseEntity.ok("Gallery item updated successfully ✅");

        } catch(Exception e) {

            e.printStackTrace();

            return ResponseEntity.badRequest().body("Update failed ❌");
        }
    }

    
    
    // ✅ DELETE IMAGE
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteImage(@PathVariable Long id) {

        Optional<Gallery> optional =
                galleryRepository.findById(id);

        if (optional.isEmpty()) {

            return ResponseEntity.badRequest()
                    .body("Image not found ❌");
        }

        Gallery gallery = optional.get();

        // 🔥 Delete file from folder
        String[] paths = {
        	    gallery.getSmallImagePath(),
        	    gallery.getMediumImagePath(),
        	    gallery.getLargeImagePath()
        	};

        	for(String imagePath : paths) {

        	    if(imagePath != null) {

        	        String fileName = imagePath.replace("/gallery/", "");

        	        String filePath =
        	                System.getProperty("user.dir")
        	                + File.separator
        	                + "gallery"
        	                + File.separator
        	                + fileName;

        	        File file = new File(filePath);

        	        if(file.exists()) {
        	            file.delete();
        	        }
        	    }
        	}

        

        // 🔥 Delete from DB
        galleryRepository.deleteById(id);
        // for recent activity
        activityLogRepository.save(new ActivityLog(
        	    "Gallery Image Deleted", "GALLERY", "DELETED"));

        return ResponseEntity.ok(
                "Image deleted successfully ✅");
    }

    // ✅ GET ALL IMAGES
    @GetMapping("/all")
    public ResponseEntity<?> getAll() {

        return ResponseEntity.ok(
                galleryRepository.findAllByOrderByUploadDateDesc()
        );
    }
}