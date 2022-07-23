package com.rng.managedata.customer.controller;

import com.rng.managedata.customer.service.CustomerDataService;
import com.rng.managedata.database.mybatis.dto.customer.CustomerInfo;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

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
    @GetMapping(value = "/list")
    public String list(Model model, CustomerInfo info){
        return customerDataService.list(model, info);
    }

    /**
     * FUNCTION :: 고객정보 상세페이지 호출
     * @param model
     * @param info
     * @return
     */
    @GetMapping(value = "/view")
    public String view(Model model, CustomerInfo info) {return customerDataService.view(model, info);}

    /**
     * FUNCTION :: 고객정보 등록/수정 페이지호출
     * @param model
     * @param info
     * @return
     */
    @GetMapping(value = "/form")
    public String form(Model model, CustomerInfo info) {return customerDataService.form(model, info);}

    /**
     * FUNCTION :: 등록/수정 처리
     * @param info
     * @return
     */
    @PostMapping(value = "/")
    @ResponseBody
    public String save(CustomerInfo info) {return customerDataService.save(info);}

    /**
     * FUNCTION :: 선택부서의 담당자 리스트 정보호출 (조직도기능작업 완료후 로직작성예정)
     * @param code
     * @return
     */
    @GetMapping(value = "/contact-info")
    @ResponseBody
    public String getContactInfo(String code){
        return customerDataService.getContactInfo(code);
    }

    /**
     * FUNCTION :: 고객정보 삭제처리(DEL_YN 처리)
     * @param info
     * @return
     */
    @DeleteMapping(value = "/")
    @ResponseBody
    public String delete(CustomerInfo info) {return customerDataService.delete(info);}
}
