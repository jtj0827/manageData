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
    private Date regDate;                           // LINE :: 등록일
    private String denyIp;                          // LINE :: IP 접근제한 여부

    public String getFormatedRegDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        if (this.regDate == null) { return ""; }
        return format.format(this.regDate);
    }
}
