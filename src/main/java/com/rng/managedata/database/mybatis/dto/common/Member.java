package com.rng.managedata.database.mybatis.dto.common;

import com.rng.managedata.database.jpa.entity.common.MemberEntity;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter @Setter
@ToString
public class Member {
    private Long idx;                                               // LINE :: 고유값
    private Integer auth = 1;                                       // LINE :: 권한
    private String position;                                        // LINE :: 직급
    private String name;                                            // LINE :: 이름
    private String phoneNum;                                        // LINE :: 핸드폰 번호
    private String tel;                                             // LINE :: 전화번호
    private String email;                                           // LINE :: 이메일 주소
    private Account accountObject;                                  // LINE :: 계정 객체
    private String departmentCode;                                  // LINE :: 부서코드

}
