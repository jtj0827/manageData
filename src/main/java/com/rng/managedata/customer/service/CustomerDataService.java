package com.rng.managedata.customer.service;

import com.rng.managedata.common.service.CommonService;
import com.rng.managedata.database.jpa.entity.customer.CustomerInfoEntity;
import com.rng.managedata.database.jpa.repository.customer.CustomerInfoRepository;
import com.rng.managedata.database.mybatis.dto.customer.CustomerInfo;
import com.rng.managedata.database.mybatis.mapper.customer.CustomerInfoMapper;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.Map;

@Service
@AllArgsConstructor
public class CustomerDataService extends CommonService {

    private final CustomerInfoMapper customerInfoMapper;

    private final CustomerInfoRepository customerInfoRepository;

    /**
     * FUNCTION :: 고객정보 리스트페이지 호출
     * @param model
     * @param customerInfo
     * @return
     */
    public String list(Model model, CustomerInfo customerInfo){
        int totalCount = customerInfoMapper.countByDto(customerInfo);
        setDefaultPaging(model, customerInfo, totalCount);
        model.addAttribute("info", customerInfoMapper.findByDto(customerInfo));
        return "/customer/info/list";
    }

    /**
     * FUNCTION :: 상세페이지 호출
     * @param model
     * @param customerInfo
     * @return
     */
    public String view(Model model, CustomerInfo customerInfo){

        return "/customer/info/view";
    }

    /**
     * FUNCTION :: 등록/수정 페이지 호출
     * @param model
     * @param customerInfo
     * @return
     */
    public String form(Model model , CustomerInfo customerInfo){

        return "/customer/info/form";
    }

    /**
     * FUNCTION :: 등록/수정 처리
     * @param customerInfo
     * @return
     */
    public String save(CustomerInfo customerInfo){
        Map<String, Object> rtnMap = returnMap();

        return jsonFormatTransfer(rtnMap);
    }

    /**
     * FUNCTION :: 고객데이터 삭제처리 (DEL_YN 처리)
     * @param customerInfo
     * @return
     */
    public String delete(CustomerInfo customerInfo){
        Map<String, Object> rtnMap = returnMap();
        CustomerInfoEntity info = customerInfoRepository.findByIdx(customerInfo.getIdx());
        if (info != null){
            info.delete();
            rtnMap.put(AJAX_RESULT_TEXT, AJAX_RESULT_SUCCESS);
        } else {
            rtnMap.put(AJAX_RESULT_TEXT, AJAX_RESULT_NODATA);
        }
        return jsonFormatTransfer(rtnMap);
    }
}
