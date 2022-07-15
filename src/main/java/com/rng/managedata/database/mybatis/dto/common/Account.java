package com.rng.managedata.database.mybatis.dto.common;

import lombok.Getter;
import lombok.Setter;

import java.text.SimpleDateFormat;
import java.util.Date;

@Getter@Setter
public class Account extends Paging {

    private Long idx;                               // LINE :: 고유값
    private String id;                              // LINE :: 아이디
    private String password;                        // LINE :: 비밀번호
    private String pwdText;                         // LINE :: 비밀번호 평문                      
    private String name;                            // LINE :: 이름
    private Integer auth;                           // LINE :: 권한
    private String email;                           // LINE :: 메일주소
    private String phone;                           // LINE :: 전화번호
    private String regId;                           // LINE :: 등록자 아이디
    private Date regDate;                           // LINE :: 등록일
    private String denyIp;                          // LINE :: IP 접근제한 여부

    private Long partnerIdx;                        // LINE :: 파트너사 고유값
    private String step;                            // LINE :: 파트너사 스텝( K : 기원테크, Z : 0스텝, O : 1스텝, B : below)
    private String subDomain;                       // LINE :: 파트너사 서브 도메인

    public String getFormatedRegDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        if (this.regDate == null) { return ""; }
        return format.format(this.regDate);
    }
}
