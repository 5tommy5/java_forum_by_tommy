package com.forum.entity;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.HashSet;
import java.util.Set;

@Entity
public class Comment {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "arcticle__id")
    private Arcticle arcticle;
    @ManyToOne
    private User user;
   // private Long usid;

    /*public Comment(Long arid) {
        this.arid = arid;
    }*/
    public Comment(Arcticle a){ this.arcticle = a; this.user = new User();}

   // private Long arid;

    public Set<User> getUsers() {
        return users;
    }

    public void setUsers(Set<User> users) {
        this.users = users;
    }

   /* public Long getArid() {
        return arid;
    }

    public void setArid(Long arid) {
        this.arid = arid;
    }

    public Long getUsid() {
        return usid;
    }

    public void setUsid(Long usid) {
        this.usid = usid;
    }*/
    @ManyToMany(cascade = { CascadeType.ALL }, fetch = FetchType.EAGER)
    @JoinTable(
            name = "likedComments_Users",
            joinColumns = { @JoinColumn(name = "comment_id") },
            inverseJoinColumns = { @JoinColumn(name = "user_id") }
    )
    private Set<User> users = new HashSet<>();
    @Column(columnDefinition="TEXT")
    private String text;
    private LocalDateTime time;
    @OneToMany
    private Set<Comment> replys;

    public Comment() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Arcticle getArcticle() {
        return arcticle;
    }

    public void setArcticle(Arcticle arcticle) {
        this.arcticle = arcticle;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
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


    public Set<Comment> getReplys() {
        return replys;
    }

    public void setReplys(Set<Comment> replys) {
        this.replys = replys;
    }
}