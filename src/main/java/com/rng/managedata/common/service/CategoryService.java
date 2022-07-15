package com.rng.managedata.common.service;

import com.rng.managedata.database.jpa.entity.common.CategoryEntity;
import com.rng.managedata.database.jpa.repository.common.CategoryRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.Map;

@Service
@RequiredArgsConstructor
public class CategoryService extends CommonService {

    private final CategoryRepository categoryRepository;

    /**
     * FUNCTION :: 카테고리 리스트 조회 AJAX
     * @param category
     * @return
     */
    public String getCategoryListAjax(CategoryEntity category) {
        Map<String, Object> rtnMap = returnMap();

        rtnMap.put("categoryList", categoryRepository.findByDepthAndTopCodeAndRefGubunAndUseYn(category.getDepth(), category.getTopCode(), category.getRefGubun(), true));
        rtnMap.put(AJAX_RESULT_TEXT, AJAX_RESULT_SUCCESS);
        return jsonFormatTransfer(rtnMap);
    }

}
