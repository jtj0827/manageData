package com.rng.managedata.database.mybatis.dto.common;

import com.rng.managedata.database.jpa.entity.common.MenuCodeEntity;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter@Setter
public class MenuCode {

    private long idx;                               // LINE :: 메뉴 고유값
    private String code;                            // LINE :: 메뉴 코드
    private String topCode;                         // LINE :: 상위 메뉴 코드
    private int depth;                              // LINE :: 메뉴 뎁스
    private String name;                            // LINE :: 메뉴 명
    private String url;                             // LINE :: 메뉴 url
    private int auth;                               // LINE :: 메뉴 권한
    private boolean useYn;                          // LINE :: 사용 여부
    private int sort;                               // LINE :: 정렬 순서

    // LINE :: 메뉴 출력 관련 변수
    private String code1;                           // LINE :: 현재 메뉴의 최상위 코드값 ( 현재 메뉴가 3뎁스인 경우에만 조회됨 )
    private String code2;                           // LINE :: 현재 메뉴의 상위 코드값
    private String code3;                           // LINE :: 현재 메뉴의 코드값
    private Long accountIdx;

    private List<MenuCodeEntity> menuCodeList;

}
