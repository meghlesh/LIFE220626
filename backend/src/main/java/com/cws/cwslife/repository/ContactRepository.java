package com.cws.cwslife.repository;

import com.cws.cwslife.model.ContactInquiry;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import java.util.List;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.transaction.annotation.Transactional;


public interface ContactRepository
        extends JpaRepository<ContactInquiry, Long> {
	List<ContactInquiry> findTop5ByIsReadFalseOrderByCreatedAtDesc();
	long countByIsReadFalse();

	// Mark all as read
	@Modifying
	@Transactional
	@Query("UPDATE ContactInquiry c SET c.isRead = true")
	void markAllAsRead();

}