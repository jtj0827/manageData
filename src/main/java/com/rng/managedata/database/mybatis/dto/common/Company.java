package com.rng.managedata.database.mybatis.dto.common;

import lombok.Getter;
import lombok.Setter;

import java.util.Date;

@Getter@Setter
public class Company extends Paging {

    private Long idx;                               // LINE :: 고유값
    private String name;                            // LINE :: 업체명
    private String regId;                           // LINE :: 등록자 아이디
    private Date regDate;                           // LINE :: 등록일

}
