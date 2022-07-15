package com.rng.managedata.database.mybatis.mapper.serverMng;

import com.rng.managedata.database.mybatis.dto.serverMng.ServerInfo;

import java.util.List;

public interface ServerInfoMapper {
    int countByDto(ServerInfo serverInfo);
    List<ServerInfo> findByDto(ServerInfo serverInfo);

    /*int serverDuplicateCheck(ServerInfo serverInfo);*/
}
