package com.alekseytyan.controller.error;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {

    @GetMapping(value = "/notFound")
    public String notFound() {
        return "error/404";
    }

    @GetMapping(value = "/accessDenied")
    public String forbidden() {
        return "error/403";
    }
}
