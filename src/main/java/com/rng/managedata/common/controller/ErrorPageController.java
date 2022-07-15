package com.rng.managedata.common.controller;

import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/error")
public class ErrorPageController {

    /**
     * FUNCTION :: 모바일 접속 방지
     * @return
     */
//    @GetMapping(value = "/preventMobile")
//    public String preventMobile(){
//        return "/error/preventMobile";
//    }
}
