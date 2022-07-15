package com.rng.managedata.database.mybatis.dto.common;

import lombok.Getter;
import lombok.Setter;
import org.springframework.format.annotation.DateTimeFormat;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

@Getter
@Setter
public class LoginLog extends Paging{
    private Long idx;
    private String accountIdx;                      // LINE :: 아이디 고유값
    private String ip;                              // LINE :: 로그인 시도 IP정보
    private String loginCode;                       // LINE :: 로그인 결과
    private Date regDate;                           // LINE :: 로그인 일자
    private String attemptId;                       // LINE :: 로그인 시도 ID

    private String id;
    private String[] codeArray = {"S", "P", "I", "N"};                 // LINE :: 검색용 로그인 결과

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date searchStartDate = new Date();
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date searchEndDate = new Date();

    public void setStartDate(){
        Calendar cal = Calendar.getInstance();
        cal.setTime(this.searchStartDate);
        cal.set(Calendar.HOUR_OF_DAY,0);
        cal.set(cal.MINUTE,0);
        cal.set(cal.SECOND,0);
        cal.set(cal.MILLISECOND,0);
        this.searchStartDate = new Date(cal.getTimeInMillis());
    }
    public void setEndDate(){
        Calendar cal = Calendar.getInstance();
        cal.setTime(this.searchEndDate);
        cal.set(Calendar.HOUR_OF_DAY,23);
        cal.set(cal.MINUTE,59);
        cal.set(cal.SECOND,59);
        this.searchEndDate = new Date(cal.getTimeInMillis());
    }
    public String getFormatedSearchStartDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        if (this.searchStartDate == null) { return ""; }
        return format.format(this.searchStartDate);
    }
    public String getFormatedSearchEndDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
        if (this.searchEndDate == null) { return ""; }
        return format.format(this.searchEndDate);
    }
    public String getFormatedRegDate() {
        SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        if (this.regDate == null) { return ""; }
        return format.format(this.regDate);
    }

    public Boolean codeCheck(String code){
        return valueCheck(codeArray, code);
    }

    public Boolean valueCheck(String[] array, String value){
        Boolean arrayCheck = false;
        if(array != null && array.length != 0){
            for(String arr : array){
                if(arr.equals(value)){
                    arrayCheck = true;
                    break;
                }
            }
        }
        return arrayCheck;
    }
}
