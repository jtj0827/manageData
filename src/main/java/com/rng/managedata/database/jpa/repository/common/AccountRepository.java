package com.rng.managedata.database.jpa.repository.common;

import com.rng.managedata.database.jpa.entity.common.AccountEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AccountRepository extends JpaRepository<AccountEntity, Long> {

    AccountEntity findById(String id);


    AccountEntity findByIdx(Long idx);

    int countById(String id);

}
