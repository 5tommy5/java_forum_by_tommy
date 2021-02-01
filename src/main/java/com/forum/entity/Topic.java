package com.forum.entity;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.Set;

@Entity
public class Topic {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @OneToMany(fetch = FetchType.EAGER)
    private Set<Arcticle> arcticles;
    private String title;
    @Column(columnDefinition="TEXT")
    private String description;
    private LocalDateTime time;
    private int countAnswers;

    public int getCountAnswers() {
        return countAnswers;
    }

    public void setCountAnswers(int countAnswers) {
        this.countAnswers = countAnswers;
    }

    public Topic() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Set<Arcticle> getArcticles() {
        return arcticles;
    }

    public void setArcticles(Set<Arcticle> arcticles) {
        this.arcticles = arcticles;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }
}
