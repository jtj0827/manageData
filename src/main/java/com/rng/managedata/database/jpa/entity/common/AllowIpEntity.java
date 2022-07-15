package com.rng.managedata.database.jpa.entity.common;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

@Entity
@Table(name = "tAllowIp")
@Getter
@Setter
public class AllowIpEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idx;
    @Column(length = 20) private String ip;
    @Column(length = 20) private String exp;
    @Column(columnDefinition = "bigint default 0") private Long partnerIdx = 0L;
}
