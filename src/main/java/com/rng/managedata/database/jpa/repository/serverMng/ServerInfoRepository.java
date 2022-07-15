package com.rng.managedata.database.jpa.repository.serverMng;

import com.rng.managedata.database.jpa.entity.serverMng.ServerInfoEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import javax.transaction.Transactional;

public interface ServerInfoRepository  extends JpaRepository<ServerInfoEntity, Long> {
    ServerInfoEntity findByIdx(Long idx);
    ServerInfoEntity findByIdxAndDelStatus(Long idx, Boolean delStatus);
}
