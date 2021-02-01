package com.forum.repository;

import com.forum.entity.Arcticle;
import com.forum.entity.Topic;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TopicRepository extends JpaRepository<Topic, Long> {
    List<Topic> findAllByOrderByTimeAsc();

}
