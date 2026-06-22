package com.cws.cwslife.controller;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.cws.cwslife.model.Career;
import com.cws.cwslife.repository.CareerRepository;

@RestController
@RequestMapping("/api/career")
@CrossOrigin(origins = "*")
public class CareerController {

    @Autowired
    private CareerRepository careerRepository;

    // ✅ ADD
    @PostMapping("/add")
    public ResponseEntity<?> addCareer(@RequestBody Career career) {
        Career savedCareer = careerRepository.save(career);
        return ResponseEntity.ok(savedCareer);
    }

    // ✅ GET ALL
    @GetMapping("/all")
    public ResponseEntity<List<Career>> getAllCareers() {
        return ResponseEntity.ok(careerRepository.findAll());
    }

    // ✅ GET BY ID
    @GetMapping("/{id}")
    public ResponseEntity<?> getCareer(@PathVariable Long id) {
        Optional<Career> career = careerRepository.findById(id);

        if (career.isPresent()) {
            return ResponseEntity.ok(career.get());
        } else {
            return ResponseEntity.status(404).body("Career not found");
        }
    }

    // ✅ UPDATE STATUS
    @PatchMapping("/status/{id}")
    public ResponseEntity<?> updateStatus(@PathVariable Long id,
                                          @RequestBody Map<String, String> statusMap) {

        Optional<Career> optional = careerRepository.findById(id);

        if (optional.isEmpty()) {
            return ResponseEntity.status(404).body("Career not found");
        }

        Career career = optional.get();
        career.setStatus(statusMap.get("status"));

        return ResponseEntity.ok(careerRepository.save(career));
    }

    // ✅ DELETE
    @DeleteMapping("/delete/{id}")
    public ResponseEntity<?> deleteCareer(@PathVariable Long id) {

        if (!careerRepository.existsById(id)) {
            return ResponseEntity.status(404).body("Career not found");
        }

        careerRepository.deleteById(id);
        return ResponseEntity.ok("Career deleted successfully");
    }

    
    //FULL UPDATE
    @PutMapping("/update/{id}")
    public ResponseEntity<?> updateCareer(@PathVariable Long id,
                                          @RequestBody Career updatedCareer) {

        Optional<Career> optional = careerRepository.findById(id);

        if (optional.isEmpty()) {
            return ResponseEntity.status(404).body("Career not found");
        }

        Career career = optional.get();

        // Basic fields
        career.setTitle(updatedCareer.getTitle());
        career.setDepartment(updatedCareer.getDepartment());
        career.setWorkType(updatedCareer.getWorkType());
        //career.setLocation(updatedCareer.getLocation());
        career.setType(updatedCareer.getType());
        career.setExperience(updatedCareer.getExperience());
        //career.setOpenings(updatedCareer.getOpenings());
        career.setStatus(updatedCareer.getStatus());

        // ✅ NEW FIELDS (IMPORTANT)
        //career.setApplicationCount(updatedCareer.getApplicationCount());
        career.setDeadline(updatedCareer.getDeadline());
        career.setDescription(updatedCareer.getDescription());
        career.setKeySkills(updatedCareer.getKeySkills());
        career.setResponsibilities(updatedCareer.getResponsibilities());
        career.setRequirements(updatedCareer.getRequirements());
        career.setEducation(updatedCareer.getEducation());

        Career saved = careerRepository.save(career);

        return ResponseEntity.ok(saved);
    }

    // ✅ GET ACTIVE
    @GetMapping("/active")
    public ResponseEntity<List<Career>> getActiveCareers() {
        List<Career> active = careerRepository.findByStatusIgnoreCase("ACTIVE");
        return ResponseEntity.ok(active);
    }
    
   
}