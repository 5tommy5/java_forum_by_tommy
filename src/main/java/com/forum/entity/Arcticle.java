package com.forum.entity;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Arcticle {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne
    private Topic topic;
    @ManyToOne
    private User user;

    private String title;
    @Column(columnDefinition="TEXT")
    private String text;
    //private Long usid;

    public Arcticle(Topic topic, User user) {
        this.topic = topic;
        this.user = user;
    }

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

    @ManyToMany(cascade = { CascadeType.ALL })
    @JoinTable(
            name = "savedArticles_Users",
            joinColumns = { @JoinColumn(name = "arcticle_id") },
            inverseJoinColumns = { @JoinColumn(name = "user_id") }
    )
    private Set<User> users = new HashSet<>();
    @Column(nullable = true)
    private int countComments;

    public int getCountComments() {
        return countComments;
    }

    public void setCountComments(int countComments) {
        this.countComments = countComments;
    }

    private int views=0;

    public int getViews() {
        return views;
    }

    public void setViews(int views) {
        this.views = views;
    }

   /* public Long getUsid() {
        return usid;
    }

    public void setUsid(Long usid) {
        this.usid = usid;
    }*/

    private LocalDateTime time;

    public Arcticle() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Topic getTopic() {
        return topic;
    }

    public void setTopic(Topic topic) {
        this.topic = topic;
    }

  /*  public Set<Comment> getComments() {
        return comments;
    }

    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }*/

    public Arcticle(Topic topic) {
        this.topic = topic;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public LocalDateTime getTime() {
        return time;
    }

    public void setTime(LocalDateTime time) {
        this.time = time;
    }
}
