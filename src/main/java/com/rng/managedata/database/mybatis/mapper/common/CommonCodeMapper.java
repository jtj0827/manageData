package com.rng.managedata.database.mybatis.mapper.common;


import com.rng.managedata.database.mybatis.dto.common.CommonCode;

public interface CommonCodeMapper {

    CommonCode findCodeNamesByCode(String code);

}
