package com.rng.managedata.database.jpa.entity.serverMng;

import com.rng.managedata.database.mybatis.dto.serverMng.StorageServer;
import lombok.*;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "tstorageServer")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@DynamicUpdate
@Getter @Setter
public class StorageServerEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "storage_idx")
    private Long idx;                                               // LINE :: 고유값

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "server_idx")
    private ServerInfoEntity serverInfo;

    @Column(length = 1) private String gubun;                       // LINE :: 스토리지 구분 (H : HDD, S : SSD), 용량입력,
    @Column private String capacity;                                // LINE :: 스토리지 용량
    @Column(length = 5) private String inch;                        // LINE :: 스토리지 인치 (2.5inch, 3.5inch 선택)
    @Column
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date storageDate;                                       // LINE :: 스토리지 입고일

    @Builder
    public StorageServerEntity(StorageServer dto, ServerInfoEntity serverInfo){
        this.gubun = dto.getGubun();
        this.capacity = dto.getCapacity();
        this.inch = dto.getInch();
        this.storageDate = dto.getStorageDate();
        this.serverInfo = serverInfo;
    }

}
