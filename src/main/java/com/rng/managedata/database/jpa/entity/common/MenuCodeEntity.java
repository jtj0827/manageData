package com.rng.managedata.database.jpa.entity.common;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.util.List;

@Entity
@Table(name = "tmenuCode")
@Getter@Setter
public class MenuCodeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long idx;                                                   // LINE :: 메뉴 고유값
    @Column(length = 4, unique = true) private String code;             // LINE :: 메뉴 코드
    @Column(length = 4) private String topCode;                         // LINE :: 상위 메뉴 코드
    @Column(length = 1) private int depth;                              // LINE :: 메뉴 뎁스
    @Column(length = 30) private String name;                           // LINE :: 메뉴 명
    @Column(length = 100) private String url;                           // LINE :: 메뉴 url
    @Column private int auth;                                           // LINE :: 메뉴 권한
    @Column private boolean useYn;                                      // LINE :: 사용 여부
    @Column(length = 1) private int sort;                               // LINE :: 정렬 순서

    @Transient
    private List<MenuCodeEntity> subCode;                               // LINE :: 하위뎁스
    @Transient
    private List<Long> accountIdxList;

}
