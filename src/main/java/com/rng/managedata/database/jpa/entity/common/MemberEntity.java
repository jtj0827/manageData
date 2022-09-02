package com.rng.managedata.database.jpa.entity.common;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@Table(name = "tmember")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@DynamicUpdate
@Getter
@ToString
public class MemberEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "mem_idx")
    private Long idx;                                               // LINE :: 고유값

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mem_idx")
    private AccountEntity accountObject;                            // LINE :: 계정 객체

    @Column private Integer auth = 1;                               // LINE :: 권한

    @Column(length = 20)
    private String position;                                        // LINE :: 직급

    @Column(length = 20)
    private String name;                                            // LINE :: 이름

    @Column(length = 13)
    private String phoneNum;                                        // LINE :: 핸드폰 번호

    @Column(length = 15)
    private String tel;                                             // LINE :: 전화번호

    @Column(length = 100)
    private String email;                                           // LINE :: 이메일 주소

    @Column(length = 4)
    private String departmentCode;                                  // LINE :: 부서코드

    @Column(columnDefinition = "bit default 0")
    private Boolean operatorYn;                                     // LINE :: 유지보수 담당자 여부
}
