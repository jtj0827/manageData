package com.rng.managedata.database.jpa.entity.common;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "tnationCode")
@Getter@Setter
public class NationCodeEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idx;                                                       // LINE :: 고유값
    @Column(length = 2) private String code;                                // LINE :: 국가 코드
    @Column(length = 50) private String name;                               // LINE :: 국가명
    @Column(columnDefinition = "bit default 1") private Boolean useYn;      // LINE :: 사용 여부
    @Column private Integer sort;                                           // LINE :: 정렬 순서

}
