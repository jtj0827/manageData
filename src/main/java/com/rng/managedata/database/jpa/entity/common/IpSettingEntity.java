package com.rng.managedata.database.jpa.entity.common;


import lombok.Getter;
import lombok.Setter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "tIpSetting")
@Getter
@Setter
public class IpSettingEntity {

    public IpSettingEntity(){}

    public IpSettingEntity(Boolean allowValue, Long partnerIdx){
        this.allowValue = allowValue;
        this.partnerIdx = partnerIdx;
    }

    @Id
    @Column(columnDefinition = "bigint default 0") private Long partnerIdx = 0L;
    @Column(columnDefinition = "bit default 1") private Boolean allowValue = true;                  // LINE :: 허용 여부 (T : 전체 아이피 허용, F : 지정 아이피 허용)
}
