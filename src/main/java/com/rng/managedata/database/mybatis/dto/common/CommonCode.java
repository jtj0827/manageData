package com.rng.managedata.database.mybatis.dto.common;

import lombok.Getter;
import lombok.Setter;

@Getter@Setter
public class CommonCode {

    private String code;                                // LINE :: 코드 (영문 2자리 + 숫자 4자리)
    private String topCode;                             // LINE :: 상위 코드 (영문 2자리 + 숫자 4자리)
    private String codeExp;                             // LINE :: 설명
    private Boolean useYn;                              // LINE :: 사용여부 (기본값 : 사용함)
    private String gubun;                               // LINE :: 구분(코드 구분 값. BK : 은행코드, LC : 지역코드, BI : 업종코드)
    private Integer depth;                              // LINE :: 코드 depth (1 > 2 > 3 ..)

    private String codeName1;
    private String codeName2;
    private String codeName3;

}
