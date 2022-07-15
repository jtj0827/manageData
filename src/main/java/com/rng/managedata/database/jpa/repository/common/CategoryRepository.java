package com.rng.managedata.database.jpa.repository.common;

import com.rng.managedata.database.jpa.entity.common.CategoryEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface CategoryRepository extends JpaRepository<CategoryEntity, Long> {

    List<CategoryEntity> findByDepthAndRefGubunAndUseYn(int depth, String refGubun, Boolean useYn);

    List<CategoryEntity> findByDepthAndTopCodeAndRefGubunAndUseYn(int depth, String topCode, String refGubun, Boolean useYn);

}