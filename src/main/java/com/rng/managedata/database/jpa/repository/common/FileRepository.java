package com.rng.managedata.database.jpa.repository.common;

import com.rng.managedata.database.jpa.entity.common.FileEntity;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface FileRepository extends JpaRepository<FileEntity, Long> {

    FileEntity findByIdx(Long idx);

    List<FileEntity> findByRefIdxAndRefGubunAndUseGubun(Long refIdx, String refGubun, String gubun);


    FileEntity findTop1ByRefIdxAndRefGubunAndUseGubun(Long refIdx, String refGubun, String gubun);

    void deleteByIdx(Long idx);

    FileEntity findByIdxAndRefGubunAndRefIdx(Long idx, String refGubun, Long refIdx);

}
