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
@Table(name = "tmessageMapping")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Getter
@ToString
public class MappingMessageEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "map_idx")
    private Long id;

    @MapsId
    @ManyToOne(fetch = FetchType.LAZY)
    private CustomerSendMessageEntity msgLog;
    @MapsId
    @ManyToOne(fetch = FetchType.LAZY)
    private CustomerInfoEntity customerInfo;
    @Column
    @CreationTimestamp
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date regDate;

}
