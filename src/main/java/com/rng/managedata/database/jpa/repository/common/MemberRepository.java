package com.rng.managedata.database.jpa.repository.common;

import com.rng.managedata.database.jpa.entity.common.MemberEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MemberRepository extends JpaRepository<MemberEntity, Long> {
    List<MemberEntity> findByDepartmentCodeOrderByAuthDesc(String departmentCode);
}
