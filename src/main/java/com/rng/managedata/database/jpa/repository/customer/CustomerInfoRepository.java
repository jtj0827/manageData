package com.rng.managedata.database.jpa.repository.customer;

import com.rng.managedata.database.jpa.entity.customer.CustomerInfoEntity;
import org.springframework.data.jpa.repository.JpaRepository;

public interface CustomerInfoRepository extends JpaRepository<CustomerInfoEntity, Long> {

    CustomerInfoEntity findByIdx(Long idx);
}
