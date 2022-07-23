package com.rng.managedata.database.mybatis.mapper.customer;

import com.rng.managedata.database.mybatis.dto.customer.CustomerInfo;

import java.util.List;

public interface CustomerInfoMapper {

    int countByDto(CustomerInfo customerInfo);
    List<CustomerInfo> findByDto(CustomerInfo customerInfo);

    /**
     * FUNCTION :: IDX 기준으로 특정데이터 조회
     * @param idx
     * @return
     */
    CustomerInfo findByIdx(Long idx);
}
