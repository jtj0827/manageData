package com.rng.managedata.database.jpa.repository.common;

import com.rng.managedata.database.jpa.entity.common.AccountEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AccountRepository extends JpaRepository<AccountEntity, Long> {

    AccountEntity findById(String id);

    AccountEntity findByIdAndStep(String id, String step);

    AccountEntity findByIdx(Long idx);

    List<AccountEntity> findAllByIdOrName(String id, String name);

    AccountEntity findByIdAndPartnerIdx(String id, Long partnerIdx);

    int countById(String id);

    int countByPartnerIdxNotAndSubDomain(Long partnerIdx, String subDomain);

    int countBySubDomain(String subDomain);

    int countByIdAndPartnerIdx(String id, Long partnerIdx);

    int countByIdxNotAndStepAndIdOrIdxNotAndStepAndName(Long idx1, String step1, String id, Long idx2, String step2, String name);

    int countByStepAndIdOrStepAndName(String step1, String id, String step2, String name);

    List<AccountEntity> findAllByPartnerIdx(Long partnerIdx);

}
