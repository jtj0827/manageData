package com.rng.managedata.common.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;

@RestControllerAdvice
public class GlobalExceptionHandler {

    private final Logger log = LoggerFactory.getLogger(this.getClass());

    @ExceptionHandler(Exception.class)
    public void globalException(Exception e){
        log.info("Exception ["+e.getClass()+"] ["+e.getMessage()+"]");
        e.printStackTrace();
    }

}
