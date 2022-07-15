package com.rng.managedata.common.service;

import com.rng.managedata.database.jpa.entity.common.CommonCodeEntity;
import com.rng.managedata.database.jpa.repository.common.CommonCodeRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
@RequiredArgsConstructor
public class CommonCodeService extends CommonService {

    private final CommonCodeRepository commonCodeRepository;

    /**
     * FUNCTION :: 공통 코드 로직 추가
     * @param explain
     * @param gubun
     * @param topCode
     * @return
     */
    public String setCommonCode(String explain, String gubun, String topCode){
        String res = "";    // LINE :: 최종 결과 값
        try{
            if (explain == null || "".equals(explain)) { return ""; }

            // LINE :: depth 세팅. topCode가 null 일 경우 0, topCode의 depth에서 +1 세팅한다.
            int depth = 1;
            if(topCode != null){ depth = commonCodeRepository.findByCode(topCode).getDepth() + 1; }

            // LINE :: 구분, 뎁스, 코드명을 기준으로 코드정보 조회하여 기존에 존재하는 내용인 경우 등록하지 않음
            CommonCodeEntity beforeInfo = commonCodeRepository.findTop1ByGubunAndDepthAndCodeExp(gubun, depth, explain);

            if (beforeInfo  != null) { return beforeInfo.getCode(); }

            // LINE :: 구분 값으로 최근 코드 조회
            CommonCodeEntity lastCode = commonCodeRepository.findTop1ByGubunOrderByCodeDesc(gubun);

            String codeNum = "01";
            // LINE :: 최근코드 존재하는 경우
            if (lastCode != null) {
                // LINE :: 구분 값 별 마지막으로 작성된 코드 넘버링 +1
                codeNum = String.valueOf(Integer.parseInt(lastCode.getCode().substring(2)) + 1);
            }
            // LINE :: 코드 값 생성
            StringBuffer codeStr = new StringBuffer();
            codeStr.append(gubun);
            // LINE :: 생성할 코드 넘버링 자릿수에 따라 '0' 추가
            if(codeNum.length() == 1){ codeStr.append("000"); }
            else if (codeNum.length() == 2) { codeStr.append("00"); }
            else if (codeNum.length() == 3) { codeStr.append("0"); }
            codeStr.append(codeNum);

            // LINE :: 공통 코드 저장 객체 생성
            CommonCodeEntity entity = CommonCodeEntity.builder()
                    .code(codeStr.toString())
                    .codeExp(explain)
                    .topCode(topCode)
                    .depth(depth)
                    .build();
            // LINE :: 공통코드 저장 후 반환 값 세팅
            commonCodeRepository.save(entity);
            res = codeStr.toString();
        }catch (Exception e){
            log.info("common code setting error");
        }
        return res;
    }

    /**
     * FUNCTION :: 상위 코드 기준으로 코드 목록 조회
     * @param commonCodeEntity
     * @return
     */
    public String getCodeListAjax(CommonCodeEntity commonCodeEntity) {
        Map<String, Object> rtnMap =  returnMap();

        List<CommonCodeEntity> codeList =  commonCodeRepository.findAllByTopCodeAndGubunOrderByCodeDesc(commonCodeEntity.getTopCode(), commonCodeEntity.getGubun());
        rtnMap.put("codeList", codeList);
        rtnMap.put(AJAX_RESULT_TEXT, AJAX_RESULT_SUCCESS);
        return jsonFormatTransfer(rtnMap);
    }

}