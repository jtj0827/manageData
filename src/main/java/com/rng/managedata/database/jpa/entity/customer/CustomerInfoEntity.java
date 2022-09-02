package com.rng.managedata.database.jpa.entity.customer;

import com.rng.managedata.database.jpa.entity.common.CommonCodeEntity;
import com.rng.managedata.database.mybatis.dto.customer.CustomerInfo;
import lombok.*;
import org.hibernate.annotations.ColumnDefault;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "tcustomerInfo")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@DynamicUpdate
@Getter @ToString
public class CustomerInfoEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "customer_idx")
    private Long idx;                                       // LINE :: 고유값

    @Column(length = 10)
    private String customerName;                            // LINE :: 고객명

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

    @Column(columnDefinition = "bit default 0")
    private Boolean delStatus = false;                              // LINE :: 삭제여부

    @OneToMany(mappedBy = "customerInfo", cascade = CascadeType.ALL)
    private List<MappingMessageEntity> relay = new ArrayList<>();   // LINE :: 중계 테이블 (사용자 정보, 메세지 로그)


    @OneToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "code")
    private CommonCodeEntity inflowPathCode;                // LINE :: 유입경로

    @Builder
    public CustomerInfoEntity(CustomerInfo info, String regId, CommonCodeEntity inflowPathCode){
        this.customerName = info.getCustomerName();
        this.phoneNum = info.getPhoneNum();
        this.email = info.getEmail();
        this.regId = regId;
        this.regDate = info.getRegDate();
        this.inflowPathCode = inflowPathCode;
    }

    public void setModInfo(CustomerInfo info){
        this.customerName = info.getCustomerName();
        this.phoneNum = info.getPhoneNum();
        this.email = info.getEmail();
        this.regId = info.getRegId();
        this.regDate = info.getRegDate();
    }

    public void delete(){this.delStatus = true;}
}
