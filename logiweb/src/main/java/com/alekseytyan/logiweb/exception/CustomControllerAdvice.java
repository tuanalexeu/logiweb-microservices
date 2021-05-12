package com.alekseytyan.logiweb.exception;

import com.alekseytyan.logiweb.aspect.LogAnnotation;
import com.alekseytyan.logiweb.exception.httpcode.AccessDeniedException;
import com.alekseytyan.logiweb.exception.httpcode.BadRequestException;
import com.alekseytyan.logiweb.exception.httpcode.InternalException;
import com.alekseytyan.logiweb.exception.httpcode.NotFoundException;
import com.alekseytyan.logiweb.util.response.GenericResponse;
import lombok.extern.java.Log;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindException;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.context.request.WebRequest;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice(basePackages = {"com.alekseytyan.logiweb.controller"})
public class CustomControllerAdvice {

    private static final Logger logger = LoggerFactory.getLogger(CustomControllerAdvice.class);

    @ResponseStatus(HttpStatus.FORBIDDEN)
    @ExceptionHandler(AccessDeniedException.class)
    public ModelAndView accessDenied() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("error/403");
        return mav;
    }

    @ResponseStatus(HttpStatus.NOT_FOUND)
    @ExceptionHandler(NotFoundException.class)
    public ModelAndView notFound() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("error/404");
        return mav;
    }

    @ResponseStatus(HttpStatus.INTERNAL_SERVER_ERROR)
    @ExceptionHandler(InternalException.class)
    public ModelAndView internalError() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("error/500");
        return mav;
    }

    @ResponseStatus(HttpStatus.BAD_REQUEST)
    @ExceptionHandler(BadRequestException.class)
    public ModelAndView badRequest() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("error/400");
        return mav;
    }

    @ExceptionHandler(UserBlockedException.class)
    public ModelAndView userBlocked() {
        ModelAndView mav = new ModelAndView();
        mav.setViewName("error/userBlocked");
        return mav;
    }


//    @ExceptionHandler(Exception.class)
//    @LogAnnotation
//    public ModelAndView anyException() {
//        ModelAndView mav = new ModelAndView();
//        mav.setViewName("error/defaultError");
//        return mav;
//    }

}
