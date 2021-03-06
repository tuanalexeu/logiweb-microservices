package com.alekseytyan.logiweb.controller.auth;

import com.alekseytyan.logiweb.exception.UserBlockedException;
import com.alekseytyan.logiweb.service.api.LoginAttemptService;
import lombok.AllArgsConstructor;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * Controller is used to support authentication and registration operations
 */
@Controller
@AllArgsConstructor
public class AuthController {

    private final LoginAttemptService loginAttemptService;

    /**
     * Checks if user that just logged in has any role within Spring security
     * @return - true, if they have
     */
    private boolean hasAnyRole() {
        Authentication auth = SecurityContextHolder.getContext().getAuthentication();
        return auth != null
                && auth.isAuthenticated()
                && auth.getAuthorities().stream().anyMatch(a -> a.getAuthority().equals("ROLE_ADMIN")
                || a.getAuthority().equals("ROLE_DRIVER")
                || a.getAuthority().equals("ROLE_EMPLOYEE"));
    }

    @GetMapping(value = "/login")
    public String login(HttpServletRequest request,
                        Model model,
                        @RequestParam(required = false) boolean error,
                        @RequestParam(required = false) String message) {
        if(hasAnyRole()) {
            return "redirect:/homePage";
        }

        // checks whether a user exceed the number of login attempts
        if(error && loginAttemptService.isBlocked(getClientIP(request))) {
            throw new UserBlockedException();
        }

        if(message != null) {
            model.addAttribute("message", message);
        }

        return "auth/login";
    }

    /**
     * Checks user's IP
     * @return - IP as a string
     */
    private String getClientIP(HttpServletRequest request) {
        String xfHeader = request.getHeader("X-Forwarded-For");
        if (xfHeader == null) {
            return request.getRemoteAddr();
        }
        return xfHeader.split(",")[0];
    }


    @GetMapping(value = "/forgotPassword")
    public String forgotPassword() {
        if(hasAnyRole()) {
            return "redirect:/homePage";
        }
        return "auth/forgot_password";
    }

    @GetMapping(value = "/logout")
    public String logOut() {
        if(!hasAnyRole())  {
            return "redirect:/welcome";
        }
        return "auth/logout";
    }
}
