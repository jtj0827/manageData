package com.rng.managedata.database.jpa.repository.common;

import com.rng.managedata.database.jpa.entity.common.MemberEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MemberRepository extends JpaRepository<MemberEntity, Long> {
    /**
     * FUNCTION :: 부서 코드로 검색 (직급 DESC)
     * @param departmentCode
     * @return
     */
    List<MemberEntity> findByDepartmentCodeOrderByAuthDesc(String departmentCode);

    /**
     * FUNCTION :: 부서 코드로 검색 (이름 DESC)
     * @param departmentCode
     * @return
     */
    List<MemberEntity> findByDepartmentCodeOrderByNameDesc(String departmentCode);
}
