package com.rng.managedata.database.mybatis.dto.customer;

import com.rng.managedata.database.mybatis.dto.common.Paging;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.util.Date;

@Getter @Setter @ToString
public class CustomerInfo extends Paging {
    private Long idx;                                               // LINE :: 고유값

    private String name;                                            // LINE :: 고객명

    private String phoneNum;                                        // LINE :: 고객 핸드폰번호

    private String email;                                           // LINE :: 고객 이메일

    private String regId;                                           // LINE :: 등록자 아이디

    private Date regDate;                                           // LINE :: 등록일
}
