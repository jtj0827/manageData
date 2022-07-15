package com.rng.managedata.database.jpa.repository.common;

import com.rng.managedata.database.jpa.entity.common.MenuCodeEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import javax.transaction.Transactional;
import java.util.List;

public interface MenuCodeRepository extends JpaRepository<MenuCodeEntity, Long> {

    List<MenuCodeEntity> findByDepthAndUseYnAndAuth(int depth, boolean useYn, int auth);

    List<MenuCodeEntity> findByDepthAndUseYnAndAuthOrderBySortAsc(int depth, boolean useYn, int auth);

    List<MenuCodeEntity> findByDepthAndUseYnAndAuthAndTopCodeOrderBySortAsc(int depth, boolean useYn, int auth, String topCode);

    List<MenuCodeEntity> findByDepthAndUseYnAndTopCode(int depth, boolean useYn, String topCode);

    @Transactional
    @Modifying
    void deleteAllByAuth(int auth);


}
