package com.rng.managedata.login.controller;

import com.rng.managedata.database.jpa.entity.common.AccountEntity;
import com.rng.managedata.login.service.LoginService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@AllArgsConstructor
public class LoginController {

    private final LoginService loginService;

    /**
     * FUNCTION :: 로그인 페이지
     * @return
     */
    @GetMapping(value = {"", "/"})
    public String root() {
        return "redirect:/login/form";
    }

    /**
     * FUNCTION :: 로그인 페이지
     * @return
     */
    @GetMapping(value = "/login/form")
    public String loginForm(Model model) {
        return loginService.loginForm(model);
    }

    /**
     * FUNCTION :: 로그인 요청
     * @param loginInfo
     * @return
     */
    @PostMapping(value = "/login/request")
    @ResponseBody
    public String login(AccountEntity loginInfo) {
        return loginService.login(loginInfo);
    }

    /**
     * FUNCTION :: 로그아웃
     * @return
     */
    @GetMapping(value = "/logout")
    public String logout() {
        return loginService.logout();
    }

}
