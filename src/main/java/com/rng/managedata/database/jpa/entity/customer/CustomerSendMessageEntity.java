package com.rng.managedata.database.jpa.entity.customer;

import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tcustomerSendMessage")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@DynamicUpdate
@Getter
@ToString
public class CustomerSendMessageEntity {
    @Id
    @Column(name = "logIdx")
    private Long idx;                   // LINE :: 로그 고유값

    
}
