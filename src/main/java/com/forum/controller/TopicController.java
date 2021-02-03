package com.forum.controller;

import com.forum.entity.Arcticle;
import com.forum.entity.Comment;
import com.forum.entity.Topic;
import com.forum.entity.User;
import com.forum.repository.ArcticleRepository;
import com.forum.repository.CommentRepository;
import com.forum.repository.TopicRepository;
import com.forum.repository.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import java.lang.reflect.Array;
import java.time.format.DateTimeFormatter;

import javax.validation.Valid;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;

@Controller
public class TopicController {
    @Autowired
    private TopicRepository topRep;
    @Autowired
    private ArcticleRepository arcRep;
    @Autowired
    private CommentRepository comRep;
    @Autowired
    private UserRepository usRep;

    @GetMapping("/topics")
    public String allTopics(Model model)
    {
        List<Topic> t = topRep.findAllByOrderByTimeAsc();
        for (Topic t1:t
             ) {
            t1.setCountAnswers(arcRep.findAllByTopic_Id(t1.getId()).size());
        }
        model.addAttribute("topics", t);
        return "topics";
    }
    @GetMapping("/topics/{id}")
    public String allArcticles(@PathVariable(value = "id") long id, Model model)
    {
        Optional<Topic> topic = topRep.findById(id);
        ArrayList<Topic> top = new ArrayList<>();
        topic.ifPresent(top::add);
        List<Arcticle> arc = arcRep.findAllByTopic_Id(id);
        for (Arcticle a: arc
             ) {
            a.setCountComments(comRep.getAllByArcticle(a).size());
        }
        /*for (Topic tp: top) {
            for (Arcticle ar: tp.getArcticles()) {
                arc.add(ar);
            }
        }*/
        model.addAttribute("topicId", id);
        model.addAttribute("arcticles", arc);
        //model.addAttribute("")
        return "arcticles";
    }
    @GetMapping("/arcticles/{id}")
    public String article(@PathVariable(value = "id") long id, Model model)
    {
        Optional<Arcticle> arcticle = arcRep.findById(id);
        ArrayList<Arcticle> arc = new ArrayList<>();
        arcticle.ifPresent(arc::add);

        ArrayList<User> u = new ArrayList<>();
        Comment newcom;
        ArrayList<Comment> comments = new ArrayList<>();
        //Long arid = 0L ;
        /*for (Arcticle a:arc
             ) {
            u.add(a.getUser());
            a.setViews(a.getViews()+1);
            arcRep.save(a);
            //newcom.setArcticle(a);
            arid = a.getId();
            comments = comRep.getAllByArcticle(a);
        }*/

        arc.get(0).setViews(arc.get(0).getViews()+1);
        arcRep.save(arc.get(0));
        comments = comRep.getAllByArcticle(arc.get(0));
        newcom = new Comment(); //arc.get(0));
        newcom.setArcticle(arc.get(0));
        //newcom.setArid(arid);
        model.addAttribute("newcom", newcom);
        model.addAttribute("arcticl", arc);
        model.addAttribute("comments", comments);
        return "simparc";
    }
    @PostMapping("/arcticles/{id}")
    public String postCom(@ModelAttribute("newcom") @Valid Comment comment, Model model){
        comment.setTime(LocalDateTime.now());
        Arcticle a = comment.getArcticle();
       // Comment c = comRep.getOne(comment.getId());
        //Arcticle arc = c.getArcticle();
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        comment.setUser(usRep.getOne(user.getId()));
        //comment.setArcticle(arcRep.getOne(arc.getId()));
        comment.setId(null);
        comRep.saveAndFlush(comment);
        //comRep.getOne(comment.getId()).getArcticle().getId();
        return "redirect:/arcticles/"+comRep.getOne(comment.getId()).getArcticle().getId();
    }

    @GetMapping("/admin/add-topic")
    public String addTopic(Model model)
    {
        model.addAttribute("topic", new Topic());
        return "add-topic";
    }
    @PostMapping("/admin/add-topic")
    public String postTopic(@ModelAttribute("userForm") @Valid Topic topic, Model model)
    {
        topic.setTime(LocalDateTime.now());
        topRep.save(topic);
        return "redirect:/topics/" + topic.getId();
    }
    @GetMapping("/add-arcticle/{topic}")
    public String getAddArcticle(@PathVariable(value="topic") long topic, Model model)
    {
        Topic thisTop = topRep.getOne(topic);

        model.addAttribute("arc", new Arcticle(thisTop));
        return "add-arcticle";
    }
    @PostMapping("/add-arcticle/{topic}")
    public String postAddArcticle( @ModelAttribute("arc") @Valid Arcticle arc, Model model)
    {
        //User us = usRep.getOne(arc.getUser().getId());
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();

        arc.setUser(user);
        arc.setTime(LocalDateTime.now());
        arcRep.save(arc);
        return "redirect:/topics/"+arcRep.getOne(arc.getId()).getTopic().getId();// + arc.getTopic().getId();
    }
    //likes

    @GetMapping("/arcticle/like/{id}/{comment}")
    public String like(@PathVariable(value="id") long id, @PathVariable(value="comment") long comment, Model model)
    {
        User u = usRep.getOne(id);
        Comment com = comRep.getOne(comment);
        com.getUsers().add(u);
        //u.getLikedComments().add(com);
        //usRep.save(u);
        comRep.save(com);
        return "redirect:/arcticles/"+com.getArcticle().getId();
    }
    @GetMapping("arcticle/save/{id}/{arcticle}")
    public String save(@PathVariable(value="id") long id, @PathVariable(value="arcticle") long arcticle, Model model)
    {
        Arcticle a = arcRep.getOne(arcticle);
        a.getUsers().add(usRep.getOne(id));
        arcRep.save(a);
        return "redirect:/arcticles/"+arcticle;
    }
    @GetMapping("/profile/{id}")
    public String profile(@PathVariable(value = "id") long id, Model model) {
        User u = usRep.getOne(id);
        List<Arcticle> a = new ArrayList<Arcticle>(u.getArcticles());
        List<Arcticle> ar =  arcRep.findAllByUser(u);
        for (Arcticle a1: a
        ) {
            a1.setCountComments(comRep.getAllByArcticle(a1).size());
        }
        for (Arcticle a2: ar
        ) {
            a2.setCountComments(comRep.getAllByArcticle(a2).size());
        }
        model.addAttribute("created", ar);
        model.addAttribute("saved", a);
        model.addAttribute("user", u);
        return "profile";
    }
}
