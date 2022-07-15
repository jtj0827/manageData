package com.rng.managedata.database.jpa.repository.common;

import com.rng.managedata.database.jpa.entity.common.NationCodeEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface NationCodeRepository extends JpaRepository<NationCodeEntity, Long> {

    List<NationCodeEntity> findAllByUseYnOrderBySort(Boolean useYn);

}
