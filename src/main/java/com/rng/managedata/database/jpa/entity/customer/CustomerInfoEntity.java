package com.rng.managedata.database.jpa.entity.customer;

import com.rng.managedata.database.mybatis.dto.customer.CustomerInfo;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "tcustomerInfo")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@DynamicUpdate
@Getter
@ToString
public class CustomerInfoEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customer_idx")
    private Long idx;                                               // LINE :: 고유값

    @Column(length = 10)
    private String name;                                            // LINE :: 고객명

    @Column(length = 13)
    private String phoneNum;                                        // LINE :: 고객 핸드폰번호

    @Column(length = 100)
    private String email;                                           // LINE :: 고객 이메일

    @Column(length = 50)
    private String regId;                                           // LINE :: 등록자 아이디

    @Column
    @CreationTimestamp
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date regDate;                                           // LINE :: 등록일

    @Column(columnDefinition = "bit default '0'")
    private Boolean delStatus;                                      // LINE :: 삭제여부


    @Builder
    public CustomerInfoEntity(CustomerInfo info){
        this.name = info.getName();
        this.phoneNum = info.getPhoneNum();
        this.email = info.getEmail();
        this.regId = info.getRegId();
        this.regDate = info.getRegDate();
    }

    public void setModInfo(CustomerInfo info){
        this.name = info.getName();
        this.phoneNum = info.getPhoneNum();
        this.email = info.getEmail();
        this.regId = info.getRegId();
        this.regDate = info.getRegDate();
    }

    public void delete(){this.delStatus = true;}
}
