package com.rng.managedata.customer.controller;

import com.rng.managedata.customer.service.CustomerDataService;
import com.rng.managedata.database.mybatis.dto.customer.CustomerInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/customer-info")
public class CustomerDataController {

    private final CustomerDataService customerDataService;

    /**
     * FUNCTION :: 고객정보 리스트페이지 호출
     * @param model
     * @param info
     * @return
     */
    @GetMapping(value = "list")
    public String list(Model model, CustomerInfo info){
        return customerDataService.list(model, info);
    }
}
