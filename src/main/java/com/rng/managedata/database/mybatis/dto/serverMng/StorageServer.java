package com.rng.managedata.database.mybatis.dto.serverMng;

import com.rng.managedata.database.jpa.entity.serverMng.StorageServerEntity;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.Column;
import java.util.Date;

@Getter
@Setter
public class StorageServer {
    private Long idx;                                           // LINE :: 고유값
    private Long serverIdx;                                     // LINE :: 서버 고유값
    private String gubun;                                       // LINE :: 스토리지 구분 (H : HDD, S : SSD), 용량입력,
    private String capacity;                                    // LINE :: 스토리지 용량
    private String inch;                                        // LINE :: 스토리지 인치 (2.5inch, 3.5inch 선택)
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date storageDate;                                   // LINE :: 스토리지 입고일


    public StorageServer EntityToDto(StorageServerEntity entity){
        this.idx = entity.getIdx();
        this.gubun = entity.getGubun();
        this.capacity = entity.getCapacity();
        this.inch = entity.getInch();
        this.storageDate = entity.getStorageDate();
        return this;
    }
}
