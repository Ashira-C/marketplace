package com.marketplace.backend.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.marketplace.backend.entity.User;
import com.marketplace.backend.service.UserService;

@RestController
@RequestMapping("/auth")
public class AuthController {
    @Autowired
    private UserService userService;

    @PostMapping("/register")
    public User register(@RequestBody User user) {
        return userService.register(user);
    }

    @PostMapping("/login")
    public String login(@RequestBody User user) {
        User LoggedInUser = userService.login(user.getEmail(),  user.getPassword());
        return "LOGIN SUCCESS";
    }
}
