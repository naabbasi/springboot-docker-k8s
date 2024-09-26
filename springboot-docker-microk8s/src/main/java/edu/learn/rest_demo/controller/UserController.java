package edu.learn.rest_demo.controller;

import edu.learn.rest_demo.entities.User;
import edu.learn.rest_demo.repos.UserRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RequestMapping("/users")
@RestController
class UserController {
    @Autowired
    private UserRepo userRepo;

    public UserController(UserRepo userRepo) {
        this.userRepo = userRepo;
    }

    @GetMapping(path = "/")
    public List<User> users() {
        return this.userRepo.findAll();
    }
}