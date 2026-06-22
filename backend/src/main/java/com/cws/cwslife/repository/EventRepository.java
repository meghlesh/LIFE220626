package com.cws.cwslife.repository;

import com.cws.cwslife.model.Event;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface EventRepository extends JpaRepository<Event, Long> {

    // get event by status
    List<Event> findByStatus(String status);

    // total count by status
    long countByStatus(String status);

    // latest events first
    List<Event> findTop10ByOrderByCreatedAtDesc();
    
	  //Total updated events count
	  @Query("SELECT SUM(e.updateCount) FROM Event e")
	  Long sumUpdateCount();
	
	  //Total deleted events count
	  @Query("SELECT SUM(e.deleteCount) FROM Event e")
	  Long sumDeleteCount();
	  
	// Upcoming - nearest date first (ascending)
	  List<Event> findByStatusOrderByEventDateAsc(String status);

	  // Past - latest date first (descending)
	  List<Event> findByStatusOrderByEventDateDesc(String status);
}

