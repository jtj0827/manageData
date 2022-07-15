package com.rng.managedata.serverMng.service;

import com.rng.managedata.common.service.CommonService;
import com.rng.managedata.common.service.FileService;
import com.rng.managedata.common.values.FileUseGubun;
import com.rng.managedata.common.values.RefGubun;
import com.rng.managedata.database.jpa.entity.serverMng.ServerInfoEntity;
import com.rng.managedata.database.jpa.entity.serverMng.StorageServerEntity;
import com.rng.managedata.database.jpa.repository.common.CommonCodeRepository;
import com.rng.managedata.database.jpa.repository.common.FileRepository;
import com.rng.managedata.database.jpa.repository.serverMng.ServerInfoRepository;
import com.rng.managedata.database.jpa.repository.serverMng.StorageServerRepository;
import com.rng.managedata.database.mybatis.dto.serverMng.ServerInfo;
import com.rng.managedata.database.mybatis.mapper.serverMng.ServerInfoMapper;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class ServerInfoService extends CommonService {

    private final CommonCodeRepository commonCodeRepository;
    private final StorageServerRepository storageServerRepository;
    private final ServerInfoRepository serverInfoRepository;
    private final ServerInfoMapper serverInfoMapper;
    private final FileService fileService;
    private final FileRepository fileRepository;


    /**
     * FUNCTION :: 서버정보관리 리스트페이지
     * @param model
     * @param serverInfo
     * @return
     */
    public String list(Model model, ServerInfo serverInfo){
        int totalCount = serverInfoMapper.countByDto(serverInfo);
        setDefaultPaging(model, serverInfo, totalCount);
        model.addAttribute("serverList", serverInfoMapper.findByDto(serverInfo));
        return "/serverMng/info/list";
    }

    /**
     * FUNCTION :: 서버정보관리 등록 및 수정페이지
     * @param model
     * @param serverInfo
     * @return
     */
    public String form(Model model, ServerInfo serverInfo){
        ServerInfoEntity info = serverInfoRepository.findByIdx(serverInfo.getServerIdx());
        if(info != null){ model.addAttribute("serverInfo", new ServerInfo().EntityToDto(info)); }
        model.addAttribute("osList", commonCodeRepository.findAllByGubunOrderByCodeDesc("OS"));
        return "/serverMng/info/form";
    }

    /**
     * FUNCTION :: 등록 및 수정 처리
     * @param serverInfo
     * @return
     */
    public String save(ServerInfo serverInfo){
        Map<String, Object> rtnMap = returnMap();
        Long idx;
        ServerInfoEntity before = serverInfoRepository.findByIdx(serverInfo.getServerIdx());
        serverInfo.setRegId(getLoginInfo().getId());
        ServerInfoEntity info = ServerInfoEntity.builder().info(serverInfo).build();
        if(before == null){                     // LINE :: 신규 생성
            serverInfoRepository.save(info);
            idx = info.getIdx();
        } else {                                // LINE :: 수정
            before.setModInfo(serverInfo);
            storageServerRepository.deleteByServerInfo(before);
            idx = before.getIdx();

            if(serverInfo.getStorageList() != null){
                List<StorageServerEntity> storageServerList = new ArrayList<>();
                serverInfo.getStorageList().stream().forEach(storage -> {
                    storageServerList.add(StorageServerEntity.builder().dto(storage).serverInfo(before).build());
                });
                storageServerRepository.saveAll(storageServerList);
            }
        }

        rtnMap.put("idx", idx);

        fileService.fileUpload(serverInfo.getServerImageFile(), RefGubun.SERVER_INFO.getText(), FileUseGubun.SERVER_IMAGE.getText(), info.getIdx());
        rtnMap.put(AJAX_RESULT_TEXT, AJAX_RESULT_SUCCESS);
        return jsonFormatTransfer(rtnMap);
    }

    public String view(Model model, ServerInfo serverInfo){
        ServerInfoEntity info = serverInfoRepository.findByIdx(serverInfo.getServerIdx());
        model.addAttribute("info", new ServerInfo().EntityToDto(info));
        model.addAttribute("serverImg", fileRepository.findTop1ByRefIdxAndRefGubunAndUseGubun(serverInfo.getServerIdx(), RefGubun.SERVER_INFO.getText(), FileUseGubun.SERVER_IMAGE.getText()));
        model.addAttribute("osList", commonCodeRepository.findAllByGubunOrderByCodeDesc("OS"));
        return "/serverMng/info/view";
    }

    public String deleteInfo(ServerInfo info){
        Map<String, Object> rtnMap = returnMap();
        ServerInfoEntity infoEntity = serverInfoRepository.findByIdxAndDelStatus(info.getServerIdx(), false);
        if(infoEntity.getDelStatus() == true){
            rtnMap.put(AJAX_RESULT_TEXT, AJAX_RESULT_NODATA);
        } else {
            infoEntity.delete();
            rtnMap.put(AJAX_RESULT_TEXT, AJAX_RESULT_SUCCESS);
        }
        return jsonFormatTransfer(rtnMap);
    }
}
