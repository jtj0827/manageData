package com.rng.managedata.customer.controller;

import com.rng.managedata.customer.service.CustomerSendMessageService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/custom-send")
public class CustomSendMessageController {

    private final CustomerSendMessageService customerSendMessageService;

    public String list(Model model){
        return customerSendMessageService.list(model);
    }
}
