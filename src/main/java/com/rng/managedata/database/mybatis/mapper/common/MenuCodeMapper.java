package com.rng.managedata.database.mybatis.mapper.common;


import com.rng.managedata.database.mybatis.dto.common.MenuCode;

import java.util.List;

public interface MenuCodeMapper {

    List<MenuCode> findTopMenu();

    MenuCode findOneByUrl(String url);

    MenuCode findByCode(String code);

    List<MenuCode> findLeftMenu(String topCode);

    List<String> findAllOneDepthCode();
}
