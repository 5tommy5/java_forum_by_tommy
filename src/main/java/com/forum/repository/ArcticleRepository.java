package com.forum.repository;

import com.forum.entity.Arcticle;
import com.forum.entity.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ArcticleRepository extends JpaRepository<Arcticle, Long> {
    List<Arcticle> findAllByOrderByTimeAsc();
    List<Arcticle> findAllByTopic_Id(long id);
    List<Arcticle> findAllByUser(User u);
}
