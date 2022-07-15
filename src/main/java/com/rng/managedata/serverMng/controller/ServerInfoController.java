package com.rng.managedata.serverMng.controller;

import com.rng.managedata.database.mybatis.dto.serverMng.ServerInfo;
import com.rng.managedata.serverMng.service.ServerInfoService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/servermng")
public class ServerInfoController {

    private final ServerInfoService serverInfoService;

    /**
     * FUNCTION :: 서버 정보 관리 리스트페이지 호출
     * @param model
     * @param serverInfo
     * @return
     */
    @GetMapping(value = {"/list", ""})
    public String list(Model model, ServerInfo serverInfo){
        return serverInfoService.list(model, serverInfo);
    }

    /**
     * FUNCTION :: 서버 정보 관리 등록/수정 페이지 호출
     * @param model
     * @param info
     * @return
     */
    @GetMapping(value = "/form")
    public String form(Model model, ServerInfo info){
        return serverInfoService.form(model, info);
    }

    /**
     * FUNCTION :: 서버 정보 관리 등록/수정 처리
     * @param serverInfo
     * @return
     */
    @PostMapping(value = {"", "/"})
    @ResponseBody
    public String save(ServerInfo serverInfo){
        return serverInfoService.save(serverInfo);
    }

    /**
     * FUNCTION :: 서버 정보 관리 상세페이지 호출
     * @param model
     * @param serverInfo
     * @return
     */
    @GetMapping(value = "/view")
    public String view(Model model, ServerInfo serverInfo){
        return serverInfoService.view(model, serverInfo);
    }

    /**
     * FUNCTION :: 서버 정보 관리 특정서버정보 삭제처리
     * @param info
     * @return
     */
    @PatchMapping(value = {"", "/"})
    @ResponseBody
    public String delete(ServerInfo info){
        return serverInfoService.deleteInfo(info);
    }
}
