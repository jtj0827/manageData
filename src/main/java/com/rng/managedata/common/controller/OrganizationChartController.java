package com.rng.managedata.common.controller;

import com.rng.managedata.common.service.OrganizationChartService;
import com.rng.managedata.database.mybatis.dto.common.Member;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/organization")
public class OrganizationChartController {

    private final OrganizationChartService organizationChartService;

    /**
     * FUNCTION :: 조직도 차트 페이지 호출
     * @param model
     * @return
     */
    @GetMapping(value = "/chart")
    public String chart(Model model){
        return organizationChartService.chart(model);
    }

    /**
     * FUNCTION :: 부서 선택시 해당 부서 구성원 조회
     * @param departmentCode
     * @return
     */
    @GetMapping(value = "/mem-info")
    @ResponseBody
    public String getMemberInfo(String departmentCode){
        return organizationChartService.getMemberInfo(departmentCode);
    }
}
