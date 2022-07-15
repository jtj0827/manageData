package com.rng.managedata.database.jpa.repository.common;

import com.rng.managedata.database.jpa.entity.common.IpSettingEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import javax.transaction.Transactional;

public interface IpSettingRepository extends JpaRepository<IpSettingEntity, Long> {

    IpSettingEntity findByPartnerIdx(Long partnerIdx);

    @Modifying
    @Transactional
    void deleteAllByPartnerIdx(Long partnerIdx);
}
