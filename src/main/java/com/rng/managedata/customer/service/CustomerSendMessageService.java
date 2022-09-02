package com.rng.managedata.customer.service;

import com.rng.managedata.common.service.CommonService;
import lombok.AllArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

@Service
@AllArgsConstructor
public class CustomerSendMessageService extends CommonService {

    /**
     * FUNCTION :: 사용자 메시지 발송내역 리스트페이지 호출
     * @param model
     * @return
     */
    public String list(Model model){
        model.addAttribute("sendMsgLog", "");
        return "";
    }

}
