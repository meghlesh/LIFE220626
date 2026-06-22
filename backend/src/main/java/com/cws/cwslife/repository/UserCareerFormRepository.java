package com.cws.cwslife.repository;

import java.util.List;
import java.util.Optional;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;

import org.springframework.data.jpa.repository.JpaRepository;

import com.cws.cwslife.model.UserCareerForm;

public interface UserCareerFormRepository extends JpaRepository<UserCareerForm, Long>{
	
	 Optional<UserCareerForm> findByEmail(String email);
	 
	 boolean existsByJobIdAndEmail(Long jobId, String email);
	 
	 List<UserCareerForm> findTop5ByIsReadFalseOrderByIdDesc();
     long countByIsReadFalse();
     
     @Modifying
     @Transactional
     @Query("UPDATE UserCareerForm u SET u.isRead = true")
     void markAllAsRead();

}
