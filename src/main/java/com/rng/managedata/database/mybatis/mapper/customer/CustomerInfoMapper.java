package com.rng.managedata.database.mybatis.mapper.customer;

import com.rng.managedata.database.mybatis.dto.customer.CustomerInfo;

import java.util.List;

public interface CustomerInfoMapper {

    int countByDto(CustomerInfo customerInfo);
    List<CustomerInfo> findByDto(CustomerInfo customerInfo);
}
