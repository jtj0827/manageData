package com.rng.managedata.database.mybatis.dto.customer;

import com.rng.managedata.database.jpa.entity.customer.CustomerInfoEntity;
import com.rng.managedata.database.mybatis.dto.common.Paging;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.text.SimpleDateFormat;
import java.util.Date;

@Getter @Setter @ToString
public class CustomerInfo extends Paging {
    private Long idx;                                               // LINE :: 고유값

    private String customerName;                                    // LINE :: 고객명

    private String phoneNum;                                        // LINE :: 고객 핸드폰번호

    private String email;                                           // LINE :: 고객 이메일

    private String regId;                                           // LINE :: 등록자 아이디

    private Date regDate;                                           // LINE :: 등록일

    public CustomerInfo EntityToDto(CustomerInfoEntity entity){
        this.idx = entity.getIdx();
        this.customerName = entity.getCustomerName();
        this.phoneNum = entity.getPhoneNum();
        this.email = entity.getEmail();
        this.regId = entity.getRegId();
        this.regDate = entity.getRegDate();
        return this;
    }

    public String getFormatedRegDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        if (this.regDate == null) { return ""; }
        return format.format(this.regDate);
    }
}
