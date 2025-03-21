package com.hasnae.java_pipeline_test;

// import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import java.time.LocalDateTime;

@RestController
public class HomeController {

    @GetMapping("/")
    public String home(Model model) {
        model.addAttribute("currentTime", LocalDateTime.now());
        return "index";  // This will look for index.html in /templates/
    }
}


