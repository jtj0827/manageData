package com.rng.managedata.database.jpa.repository.customer;

import com.rng.managedata.database.jpa.entity.customer.CustomerInfoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerInfoRepository extends JpaRepository<CustomerInfoEntity, Long> {

    /**
     * FUNCTION :: IDX(고유값) 기준으로 조회
     * @param idx
     * @return
     */
    CustomerInfoEntity findByIdx(Long idx);

}
