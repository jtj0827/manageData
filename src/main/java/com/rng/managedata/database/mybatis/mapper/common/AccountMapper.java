package com.rng.managedata.database.mybatis.mapper.common;



import com.rng.managedata.database.mybatis.dto.common.Account;

import java.util.List;

public interface AccountMapper {

    int countByDtoStepIsK(Account account);

    List<Account> findAllByDto(Account account);

    List<Account> findAllByDtoAdmin(Account account);

    int countByDto(Account account);

    int countByDtoForAuth(Account account);
    List<Account> findByDtoForAuth(Account account);

}
