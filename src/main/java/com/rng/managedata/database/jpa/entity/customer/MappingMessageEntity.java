package com.rng.managedata.database.jpa.entity.customer;

import com.rng.managedata.database.jpa.entity.customer.embeddable.MessagePk;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@IdClass(MessagePk.class)
@Table(name = "tmessageMapping")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@ToString
public class MappingMessageEntity {
    @Id private CustomerSendMessageEntity msgLog;
    @Id private CustomerInfoEntity customerInfo;
    @Column
    @CreationTimestamp
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date regDate;


}
