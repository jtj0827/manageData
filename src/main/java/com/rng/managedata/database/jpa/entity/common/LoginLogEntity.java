package com.rng.managedata.database.jpa.entity.common;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.text.SimpleDateFormat;
import java.util.Date;

@Entity
@Table(name = "tloginLog")
@Getter
@Setter
public class LoginLogEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long idx;
    @Column(length = 50) private Long accountIdx;                     // LINE :: 계정 고유값
    @Column(length = 15) private String ip;                         // LINE :: 로그인 시도 IP정보
    @Column(length = 1) private String loginCode;                   // LINE :: 로그인 결과 ( N : 계정 존재하지 않음, P : 비밀번호 일치하지않음, I : 접속 IP가 등록되어있지 않음, S : 성공 )
    @Column private String attemptId;                               // LINE :: 로그인 시도 ID

    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    @Column(columnDefinition = "datetime default now()")
    private Date regDate = new Date();

    public String getFormatedRegDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        if (this.regDate == null) { return ""; }
        return format.format(this.regDate);
    }
}
