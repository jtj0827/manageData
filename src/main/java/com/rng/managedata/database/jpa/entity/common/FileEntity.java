package com.rng.managedata.database.jpa.entity.common;

import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name = "tfile")
@Getter@Setter
public class FileEntity {

    public FileEntity() {}

    public FileEntity(String path, String uuid, String name, long size, String refGubun, String useGubun, String ext, long refIdx, String regId) {
        this.path = path;
        this.uuid = uuid;
        this.name = name;
        this.size = size;
        this.refGubun = refGubun;
        this.useGubun = useGubun;
        this.ext = ext;
        this.refIdx = refIdx;
        this.regId = regId;
    }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idx;                                                       // LINE :: 고유값
    @Column(length = 200) private String path;                              // LINE :: 파일 저장 경로
    @Column(length = 50) private String uuid;                               // LINE :: 저장된 파일 UUID
    @Column(length = 100) private String name;                              // LINE :: 실제 파일명
    @Column private Long size;                                              // LINE :: 파일 용량
    @Column(length = 30) private String refGubun;                           // LINE :: 연결 구분 (테이블 기준)
    @Column(length = 30) private String useGubun;                           // LINE :: 사용 구분 (ATTACH, THUMBNAIL 등 파일 용도 구분)
    @Column(length = 10) private String ext;                                // LINE :: 파일 확장자
    @Column private Long refIdx;                                            // LINE :: 연결 고유값
    @Column(length = 50) private String regId;                              // LINE :: 등록자 아이디
    @Column
    @CreationTimestamp
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private Date regDate;                                                   // LINE :: 등록일

}
