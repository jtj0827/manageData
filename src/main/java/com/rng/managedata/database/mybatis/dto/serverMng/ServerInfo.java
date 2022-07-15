package com.rng.managedata.database.mybatis.dto.serverMng;

import com.rng.managedata.database.jpa.entity.serverMng.ServerInfoEntity;
import com.rng.managedata.database.jpa.entity.serverMng.StorageServerEntity;
import com.rng.managedata.database.mybatis.dto.common.Paging;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Getter @Setter @ToString
public class ServerInfo extends Paging {
    private Long serverIdx;                     // LINE :: 고유값
    private String ip;                          // LINE :: IP (다중등록 콤마로 구분)
    private String name;                        // LINE :: 서버명칭
    private String cpu;                         // LINE :: CPU
    private String ram;                         // LINE :: RAM
    private String hdd;                         // LINE :: HDD
    private String osCode;                      // LINE :: 운영체제 코드 (tCommon_Code 테이블 구분값 'OS')
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date osInstallDate;                 // LINE :: 운영체제 설치일자
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date osUpdateDate;                  // LINE :: 운영체제 업데이트일자
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date osRebootDate;                  // LINE :: 운영체제 리부팅일자
    private String osId;                        // LINE :: 운영체제 ID
    private String osPwd;                       // LINE :: 운영체제 PWD
    private String note;                        // LINE :: 비고
    private String regId;                       // LINE :: 등록자 아이디
    private Date regDate;                       // LINE :: 등록일
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date receivingDate;                 // LINE :: 입고일
    private Boolean delStatus;                  // LINE :: 삭제여부
    private MultipartFile serverImageFile;      // LINE :: 서버 이미지 파일

    private List<StorageServer> storageList = new ArrayList<>();  // LINE :: Storage서버 리스트
    public ServerInfo EntityToDto (ServerInfoEntity info){
        this.serverIdx = info.getIdx();
        this.ip = info.getIp();
        this.name = info.getName();
        this.cpu = info.getCpu();
        this.ram = info.getRam();
        this.hdd = info.getHdd();
        this.osCode = info.getOsCode();
        this.osInstallDate = info.getOsInstallDate();
        this.osUpdateDate = info.getOsUpdateDate();
        this.osRebootDate = info.getOsRebootDate();
        this.osId = info.getOsId();
        this.osPwd = info.getOsPwd();
        this.note = info.getNote();
        this.regId = info.getRegId();
        this.regDate = new Date();
        this.receivingDate = info.getReceivingDate();
        this.delStatus = false;
        if(info.getStorageServerList() != null){
            info.getStorageServerList().stream().forEach(  storageServerEntity -> {
                this.storageList.add(new StorageServer().EntityToDto(storageServerEntity));
            } );
        }

        return this;
    }

    public String getFormatedRegDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        if (this.regDate == null) { return ""; }
        return format.format(this.regDate);
    }

    public String getFormatedReceivingDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        if (this.receivingDate == null) { return ""; }
        return format.format(this.receivingDate);
    }

    public String getFormatedOsInstallDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        if (this.osInstallDate == null) { return ""; }
        return format.format(this.osInstallDate);
    }

    public String getFormatedOsUpdateDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        if (this.osUpdateDate == null) { return ""; }
        return format.format(this.osUpdateDate);
    }

    public String getFormatedOsRebootDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        if (this.osRebootDate == null) { return ""; }
        return format.format(this.osRebootDate);
    }
}
