package com.alekseytyan.logiweb.controller.role;

import com.alekseytyan.logiweb.exception.NoSuchRoleException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.view.RedirectView;

/**
 * Home page support
 */
@Controller
public class HomePageController {

    private static final Logger logger = LoggerFactory.getLogger(HomePageController.class);

    @GetMapping(value = "/homePage")
    public RedirectView homePage() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();

        if(auth != null) {
            logger.info("User [" + auth.getName() + "] " + "has just logged in");
        }

        // Check user role in order to redirect them to corresponding page
        if (auth != null && auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_EMPLOYEE"))) {
            return new RedirectView("/employee/orders");
        } else if (auth != null && auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_DRIVER"))) {
            return new RedirectView("/driver/info");
        } else if (auth != null && auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN"))) {
            return new RedirectView("/admin/users");
        } else {
            throw new NoSuchRoleException("Invalid user role");
        }
    }

    @GetMapping(value = "/profile")
    public String profile() {
        return "auth/profile";
    }
}
