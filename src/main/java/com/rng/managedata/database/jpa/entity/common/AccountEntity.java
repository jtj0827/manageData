package com.rng.managedata.database.jpa.entity.common;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "taccount")
@Getter@Setter
public class AccountEntity {

    public AccountEntity() {}

    public AccountEntity(String id, String password, String regId) {
        this.id = id;
        this.password = password;
        this.regId = regId;
    }


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "account_idx")
    private Long idx;                                                                // LINE :: 고유값
    @Column(length = 50) private String id;                                          // LINE :: 아이디
    @Column(length = 200) private String password;                                   // LINE :: 비밀번호
    @Column(length = 200) private String pwdText;                                    // LINE :: 비밀번호 평문
    @Column(length = 50) private String regId;                                       // LINE :: 등록자 아이디
    @Column
    @CreationTimestamp
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date regDate;                                                            // LINE :: 등록일
    @Column(columnDefinition = "char(1) default 'F'") private String denyIp = "F";   // LINE :: IP 접근제한 여부 (T : 접근제한 적용, F : 접근제한 미적용)

    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "mem_idx")
    private MemberEntity OragnizationObject;                                  // LINE :: 조직도 객체(한명이 한계정 사용가능)


}
