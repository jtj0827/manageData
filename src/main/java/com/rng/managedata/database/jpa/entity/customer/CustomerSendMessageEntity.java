package com.rng.managedata.database.jpa.entity.customer;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "tcustomerSendMessage")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@DynamicUpdate
@Getter
@ToString
public class CustomerSendMessageEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "logIdx")
    private Long idx;                                               // LINE :: 로그 고유값
    @Column(length = 10) private String type;                       // LINE :: 메세지 타입 ("SMS")
    @Column(length = 1000) private String text;                     // LINE :: 메세지 내용
    @Column
    @CreationTimestamp
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date regDate;                                           // LINE :: 등록일
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "msgLog", cascade = CascadeType.ALL)
    private List<MappingMessageEntity> relay = new ArrayList<>();   // LINE :: 중계 테이블 (사용자 정보, 메세지 로그)
}
