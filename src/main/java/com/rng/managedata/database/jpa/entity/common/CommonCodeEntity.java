package com.rng.managedata.database.jpa.entity.common;

import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import org.springframework.util.StringUtils;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tcommonCode")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class CommonCodeEntity {

    @Id @Column(length = 6)
    private String code;                               // LINE :: 코드 (영문 2자리 + 숫자 4자리)
    @Column(length = 6) private String topCode;        // LINE :: 상위 코드 (영문 2자리 + 숫자 4자리)
    @Column(length = 50) private String codeExp;       // LINE :: 설명
    @Column(columnDefinition = "bit default 1")
    private Boolean useYn = true;                      // LINE :: 사용여부 (기본값 : 사용함)
    @Column(length = 4)
    private String gubun;                              // LINE :: 구분(코드 구분 값. BK : 은행코드, LC : 지역코드, BI : 업종코드)
    @Column private Integer depth;                     // LINE :: 코드 depth (1 > 2 > 3 ..)

    @Builder
    public CommonCodeEntity(String code, String topCode, String codeExp, String gubun, Integer depth){
        this.code = code;
        this.topCode = topCode;
        this.codeExp = codeExp;
        this.gubun = StringUtils.isEmpty(gubun) ? code.substring(0, 2) : gubun;
        this.depth = depth;
    }

}
