package com.rng.managedata.common.service;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.rng.managedata.database.jpa.entity.common.AccountEntity;
import com.rng.managedata.database.mybatis.dto.common.Paging;
import org.apache.commons.codec.binary.Base64;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileWriter;
import java.lang.reflect.Field;
import java.text.DecimalFormat;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class CommonService {

    public final Logger log = LoggerFactory.getLogger(this.getClass());

    public static final String AJAX_RESULT_TEXT = "httpCode";

    // LINE :: AJAX 결과 코드 ====================================================================================================================================================
    public static final String AJAX_RESULT_SUCCESS = "200";         // 성공
    public static final String AJAX_RESULT_NO_CONTENT = "204";      // 정보 없음
    public static final String AJAX_RESULT_DUPLICATE = "300";       // 중복
    public static final String AJAX_RESULT_NODATA = "400";          // 데이터 없음
    public static final String AJAX_RESULT_ILLEGAL_STATE = "401";   // 유효하지 않은 접근
    public static final String AJAX_RESULT_ILLEGAL_PERMIT = "406";  // 허용되지 않음
    public static final String AJAX_RESULT_FAIL = "500";            // 실패
    public static final String AJAX_RESULT_OVERFLOW = "999";        // 다중 행 리턴
    public static final String AJAX_RESULT_ALREADY = "600";         // 이미 처리되어 있는 경우


    @Value("${managedata.command.path}")
    private String FILE_PATH;

    @Value("${managedata.sgconf.path}")
    private String SGCONF_PATH;

    /**
     * FUNCTION :: Ajax요청에 대한 리턴 맵 객체 선언
     * @return
     */
    public HashMap<String, Object> returnMap(){
        HashMap<String, Object> rtnMap = new HashMap<>();
        rtnMap.put(AJAX_RESULT_TEXT, AJAX_RESULT_FAIL);      /* 실패 */
        return rtnMap;
    }

    /**
     * FUNCTION :: Map to JSon 형식 변환
     * @param map
     * @return String
     */
    public String jsonFormatTransfer(Map<String, Object> map) {
        String rtnJson = "";

        ObjectMapper mapper = new ObjectMapper();

        try {
            rtnJson = mapper.writeValueAsString(map);
        } catch (JsonProcessingException e) {
            log.info("jsonFormatTransfer["+e.getMessage()+"]");
        }

        return rtnJson;
    }

    /***
     * FUNCTION :: 공통 페이징 처리
     * @return
     */
    public void setDefaultPaging(Model model, Paging pagingExtendedObject, int totalCount) {
        pagingExtendedObject.setTotalCount(totalCount);  //전체 페이지수 세팅
        model.addAttribute("totalCount", totalCount);
        model.addAttribute("paging", pagingExtendedObject);
    }

    /**
     * FUNCTION :: 사용자 IP 조회
     * @return
     */
    public String getClientIP() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        String ip = request.getHeader("X-FORWARDED-FOR");
        if (ip == null) ip = request.getRemoteAddr();
        return ip;
    }

    /**
     * FUNCTION :: 로그인 정보 조회
     * @return
     */
    public AccountEntity getLoginInfo() {
        HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
        HttpSession session = request.getSession();
        return (AccountEntity) session.getAttribute("accountInfo");
    }

    public Map<String, Object> objectToMap(Object obj){
        Map<String, Object> rtnMap = new HashMap<>();
        try{
            Field[] fields = obj.getClass().getDeclaredFields();
            for(int i = 0; i <= fields.length-1; i++){
                fields[i].setAccessible(true);
                rtnMap.put(fields[i].getName(), fields[i].get(obj));
            }
        } catch (Exception e){

        }
        return rtnMap;
    }

    /**
     * FUNCTION :: 메일 본문에 포함된 이미지 src 리턴
     * @param filePath
     * @return
     */
    public String imageToBase64(String filePath) {
        String str = "";
        File file = new File( filePath );
        try {
            if ( file.isFile() ) {
                byte[] bt = new byte[ (int) file.length() ];
                FileInputStream fis = new FileInputStream( file );

                fis.read( bt );
                str = new String ( Base64.encodeBase64( bt ) );

                fis.close();
            }
        } catch(Exception e ) {
            e.printStackTrace();
        }
        return "data:image/png;base64," + str;
    }

    /**
     * FUNCTION :: 숫자 3자리 콤마
     * @param num
     * @return
     */
    public String setNumberComma(Integer num){
        DecimalFormat format = new DecimalFormat("###,###");
        String res = "0";
        if(num != null && num > 0) { res = format.format(num); }
        return res;
    }

    /**
     * FUNCTION :: 숫자 3자리 콤마
     * @param num
     * @return
     */
    public String setNumberComma(Long num){
        DecimalFormat format = new DecimalFormat("###,###");
        String res = "0";
        if(num != null && num > 0) { res = format.format(num); }
        return res;
    }

    /**
     * FUNCTION :: SPAM-GUARD 커멘드파일 생성
     * @param category
     * @param ord
     * @param idx
     */
    public void createCommandFile(String category, String ord, List<Long> idx){
        try{
            File dir = new File(FILE_PATH);
            if(!dir.exists()) { dir.mkdirs(); }                                                             // LINE :: 해당 경로에 Directory가 없으면 생성
            String filename = FILE_PATH +"\\"+ "COMMAND_" + category;
            String txt = "ORD:"+ord;

            for(Long index : idx){ txt += "\rIDX:"+index; }

            BufferedWriter fileWriter = new BufferedWriter(new FileWriter(filename, false));        // LINE :: 해당파일이 존재할시 덮어쓰기
            fileWriter.write(txt);
            fileWriter.flush();
            fileWriter.close();
        }catch (Exception e){
            log.info("Exception ["+e.getClass()+"] ["+e.getMessage()+"]");
        }
    }

    /**
     * FUNCTION :: 서버 파일 업로드 명령 생성
     * @param serverSerial
     */
    public void createSGConfCommand(String serverSerial){
        try{
            String dirPath = SGCONF_PATH + File.separator + "ORD";
            File dir = new File(dirPath);
            if(!dir.exists()) { dir.mkdirs(); }                                                             // LINE :: 해당 경로에 Directory가 없으면 생성

            String fileName = UUID.randomUUID().toString().replace("-", "").substring(0, 20) + ".ord";
            String uploadPath = dirPath + File.separator + fileName;

            StringBuffer sb = new StringBuffer();
            sb.append("SERIAL : " + serverSerial + "\r\n");
            sb.append("DST : /SGUARD/TMP");

            BufferedWriter fileWriter = new BufferedWriter(new FileWriter(uploadPath, false));        // LINE :: 해당파일이 존재할시 덮어쓰기
            fileWriter.write(sb.toString());
            fileWriter.flush();
            fileWriter.close();
        }catch (Exception e){
            log.info("Exception ["+e.getClass()+"] ["+e.getMessage()+"]");
        }
    }

}