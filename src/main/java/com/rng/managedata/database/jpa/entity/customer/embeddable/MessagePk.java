package com.rng.managedata.database.jpa.entity.customer.embeddable;

import com.rng.managedata.database.jpa.entity.customer.CustomerInfoEntity;
import com.rng.managedata.database.jpa.entity.customer.CustomerSendMessageEntity;
import lombok.EqualsAndHashCode;

import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import java.io.Serializable;

public class MessagePk implements Serializable {
    private static final long seralVersionUID = 1L;

    @EqualsAndHashCode.Include @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "logIdx")
    private CustomerSendMessageEntity msgLog;

    @EqualsAndHashCode.Include @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "customerIdx")
    private CustomerInfoEntity customerInfo;
}
