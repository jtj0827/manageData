package com.rng.managedata.database.jpa.repository.serverMng;

import com.rng.managedata.database.jpa.entity.serverMng.ServerInfoEntity;
import com.rng.managedata.database.jpa.entity.serverMng.StorageServerEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;

import javax.transaction.Transactional;
import java.util.List;

public interface StorageServerRepository extends JpaRepository<StorageServerEntity, Long> {

    @Transactional
    @Modifying
    void deleteByServerInfo(ServerInfoEntity serverInfo);
}
