package com.forum.repository;

import com.forum.entity.Arcticle;
import com.forum.entity.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.ArrayList;
import java.util.List;

public interface CommentRepository extends JpaRepository<Comment, Long> {
    ArrayList<Comment> getAllByArcticle(Arcticle arcticle);
}
