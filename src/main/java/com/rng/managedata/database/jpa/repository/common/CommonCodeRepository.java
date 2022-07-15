package com.rng.managedata.database.jpa.repository.common;

import com.rng.managedata.database.jpa.entity.common.CommonCodeEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CommonCodeRepository extends JpaRepository<CommonCodeEntity, Long> {

    CommonCodeEntity findByCode(String code);

    List<CommonCodeEntity> findAllByGubunAndDepthOrderByCodeDesc(String gubun, int depth);

    List<CommonCodeEntity> findAllByTopCodeAndGubunOrderByCodeDesc(String topCode, String gubun);

    List<CommonCodeEntity> findAllByGubunOrderByCodeDesc(String gubun);

    CommonCodeEntity findTop1ByGubunOrderByCodeDesc(String gubun);

    CommonCodeEntity findTop1ByGubunAndDepthAndCodeExp(String gubun, int depth, String codeExp);

}
