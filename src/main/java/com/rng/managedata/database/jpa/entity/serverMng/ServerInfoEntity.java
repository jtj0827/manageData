package com.rng.managedata.database.jpa.entity.serverMng;

import com.rng.managedata.database.mybatis.dto.serverMng.ServerInfo;
import com.rng.managedata.database.mybatis.dto.serverMng.StorageServer;
import lombok.*;
import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "tserverInfo")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@DynamicUpdate
@Getter @ToString
public class ServerInfoEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "server_idx")
    private Long idx;                                               // LINE :: 고유값
    @OneToMany(mappedBy = "serverInfo", cascade = CascadeType.ALL)
    private List<StorageServerEntity> storageServerList = new ArrayList<>();
    @Column(length = 200) private String ip;                        // LINE :: IP (다중등록 콤마로 구분)
    @Column(length = 100) private String name;                      // LINE :: 서버명칭
    @Column(length = 50) private String cpu;                        // LINE :: CPU
    @Column(length = 50) private String ram;                        // LINE :: RAM
    @Column(length = 50) private String hdd;                        // LINE :: HDD
    @Column(length = 6) private String osCode;                      // LINE :: 운영체제 코드 (tCommon_Code 테이블 구분값 'OS')
    @Column
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date osInstallDate;                                     // LINE :: 운영체제 설치일자
    @Column
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date osUpdateDate;                                      // LINE :: 운영체제 업데이트일자
    @Column
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date osRebootDate;                                      // LINE :: 운영체제 리부팅일자
    @Column(length = 50) private String osId;                       // LINE :: 운영체제 ID
    @Column(length = 100) private String osPwd;                     // LINE :: 운영체제 PWD
    @Column(length = 2000) private String note;                     // LINE :: 비고
    @Column(length = 50) private String regId;                      // LINE :: 등록자 아이디
    @Column
    @CreationTimestamp
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date regDate;                                           // LINE :: 등록일

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    @Column private Date receivingDate;                             // LINE :: 입고일

    @Column(columnDefinition = "bit default 0")
    private Boolean delStatus;                                      // LINE :: 삭제여부

    @Column(length = 50) private String userName;                   // LINE :: 등록자 이름





    @Builder
    public ServerInfoEntity (ServerInfo info){
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
        if(info.getStorageList() != null){
            info.getStorageList().stream().forEach(storageServer -> {
                this.storageServerList.add(StorageServerEntity.builder()
                                .dto(storageServer)
                                .serverInfo(this)
                                .build());
            });
        }
    }

    public void setModInfo(ServerInfo dto) {
        this.ip = dto.getIp();
        this.name = dto.getName();
        this.cpu = dto.getCpu();
        this.ram = dto.getRam();
        this.hdd = dto.getHdd();
        this.osCode = dto.getOsCode();
        this.osInstallDate = dto.getOsInstallDate();
        this.osUpdateDate = dto.getOsUpdateDate();
        this.osRebootDate = dto.getOsRebootDate();
        this.osId = dto.getOsId();
        this.osPwd = dto.getOsPwd();
        this.note = dto.getNote();
        this.regId = dto.getRegId();
        this.regDate = dto.getRegDate();
        this.receivingDate = dto.getReceivingDate();
    }

    public void delete(){
        this.delStatus = true;
    }

}
