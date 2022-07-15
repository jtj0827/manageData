package com.rng.managedata.database.mybatis.dto.common;

import com.rng.managedata.database.jpa.entity.common.AllowIpEntity;
import lombok.Getter;
import lombok.Setter;

import java.util.List;

@Getter
@Setter
public class AdminAccessDomain {

    private Boolean allowValue;
    private List<AllowIpEntity> allowIpEntityList;
}
