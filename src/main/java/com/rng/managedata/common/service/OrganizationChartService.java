package com.rng.managedata.common.service;

import com.rng.managedata.database.jpa.entity.common.MemberEntity;
import com.rng.managedata.database.jpa.repository.common.CommonCodeRepository;
import com.rng.managedata.database.jpa.repository.common.MemberRepository;
import com.rng.managedata.database.mybatis.dto.common.Member;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.List;
import java.util.Map;

@Service
@AllArgsConstructor
public class OrganizationChartService extends CommonService{

    private final CommonCodeRepository commonCodeRepository;

    private final MemberRepository memberRepository;

    /**
     * FUNCTION :: 조직도 페이지 호출
     * @param model
     * @return
     */
    public String chart(Model model){
        model.addAttribute("departmentInChargeList", commonCodeRepository.findAllByGubunOrderByCodeDesc("DC"));     // LINE :: 담당부서 목록
        return "";
    }

    /**
     * FUNCTION :: 부서별 구성원 정보 요청
     * @param departmentCode
     * @return
     */
    public String getMemberInfo(String departmentCode){
        Map<String, Object> rtnMap = returnMap();
        rtnMap.put("list", memberRepository.findByDepartmentCodeOrderByAuthDesc(departmentCode));
        return jsonFormatTransfer(rtnMap);
    }
}
