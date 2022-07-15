package com.rng.managedata.database.jpa.repository.common;

import com.rng.managedata.database.jpa.entity.common.AllowIpEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import javax.transaction.Transactional;
import java.util.List;

public interface AllowIpRepository extends JpaRepository<AllowIpEntity, Long> {
    List<AllowIpEntity> findAllByPartnerIdx(Long partnerIdx);

    @Modifying
    @Transactional
    void deleteAllByPartnerIdx(Long partnerIdx);
}
