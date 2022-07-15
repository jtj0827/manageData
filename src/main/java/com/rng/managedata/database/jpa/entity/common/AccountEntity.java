package com.rng.managedata.database.jpa.entity.common;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "taccount"
    , uniqueConstraints = @UniqueConstraint(columnNames = {"id", "partnerIdx"}))
@Getter@Setter
public class AccountEntity {

    public AccountEntity() {}

    public AccountEntity(String id, String password, String name, Integer auth, String email
                        , String phone, String regId, Long partnerIdx, String step, String subDomain) {
        this.id = id;
        this.password = password;
        this.name = name;
        this.auth = auth;
        this.email = email;
        this.phone = phone;
        this.regId = regId;
        this.partnerIdx = partnerIdx;
        this.step = step;
        this.subDomain = subDomain;
    }


    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idx;                                                                // LINE :: 고유값
    @Column(length = 50) private String id;                                          // LINE :: 아이디
    @Column(length = 200) private String password;                                   // LINE :: 비밀번호
    @Column(length = 200) private String pwdText;                                    // LINE :: 비밀번호 평문
    @Column(length = 50) private String name;                                        // LINE :: 이름
    @Column private Integer auth = 1;                                                // LINE :: 권한(1 : 사용자, 5 : 관리자, 10 : 마스터)
    @Column(length = 100) private String email;                                      // LINE :: 메일주소
    @Column(length = 13) private String phone;                                       // LINE :: 전화번호
    @Column(length = 50) private String regId;                                       // LINE :: 등록자 아이디
    @Column
    @CreationTimestamp
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date regDate;                                                            // LINE :: 등록일
    @Column private Long partnerIdx;                                                 // LINE :: 파트너사 고유값
    @Column(length = 1) private String step;                                         // LINE :: 파트너사 스텝 (K : 기원테크, Z : 0스텝, O : 1스텝, B : below)
    @Column(length = 100) private String subDomain;                                  // LINE :: 파트너사 서브 도메인
    @Column(columnDefinition = "char(1) default 'F'") private String denyIp = "F";   // LINE :: IP 접근제한 여부 (T : 접근제한 적용, F : 접근제한 미적용)

    /**
     * FUNCTION :: 수정 정보 세팅
     * @param otherEntity
     */
    public void setModInfo(AccountEntity otherEntity) {
        this.name = otherEntity.getName();
        this.auth = otherEntity.getAuth();
        this.email = otherEntity.getEmail();
        this.phone = otherEntity.getPhone();
    }

}
