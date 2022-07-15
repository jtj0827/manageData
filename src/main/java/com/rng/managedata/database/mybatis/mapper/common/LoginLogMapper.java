package com.rng.managedata.database.mybatis.mapper.common;


import com.rng.managedata.database.mybatis.dto.common.LoginLog;

import java.util.List;

public interface LoginLogMapper {
    List<LoginLog> findByDto(LoginLog loginLog);
    Integer countByDto(LoginLog loginLog);

}
