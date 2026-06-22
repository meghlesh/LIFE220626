package com.cws.cwslife.repository;

import com.cws.cwslife.model.EventStats;
import org.springframework.data.jpa.repository.JpaRepository;

public interface EventStatsRepository extends JpaRepository<EventStats, Long> {
}