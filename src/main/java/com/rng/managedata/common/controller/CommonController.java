package com.rng.managedata.common.controller;

import com.rng.managedata.common.service.CategoryService;
import com.rng.managedata.common.service.CommonCodeService;
import com.rng.managedata.common.service.FileService;
import com.rng.managedata.database.jpa.entity.common.CategoryEntity;
import com.rng.managedata.database.jpa.entity.common.CommonCodeEntity;
import com.rng.managedata.database.jpa.entity.common.FileEntity;
import lombok.RequiredArgsConstructor;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

@Controller
@RequiredArgsConstructor
public class CommonController {

    private final FileService fileService;
    private final CommonCodeService commonCodeService;
    private final CategoryService categoryService;

    /**
     * FUNCTION :: 에디터 이미지 업로드
     * @param response
     * @param upload
     */
    @PostMapping(value = "/file/editorImageUpload")
    public void editorImageUpload(HttpServletResponse response, MultipartFile upload) {
        fileService.editorImageUpload(response, upload);
    }

    @PostMapping(value = "/file/handleFileUpload")
    @ResponseBody
    public String handleFileUpload(@RequestParam("upload") MultipartFile uploadFile){
        return fileService.handleFileUpload(uploadFile);
    }

    /**
     * FUNCTION :: 파일 다운로드
     * @param fileEntity
     * @return
     */
    @GetMapping(value = "/file/download/{idx}")
    @ResponseBody
    public ResponseEntity<InputStreamResource> download(FileEntity fileEntity) {
        return fileService.download(fileEntity);
    }

    /**
     * FUNCTION :: 상위 코드 기준으로 코드 목록 조회
     * @param commonCodeEntity
     * @return
     */
    @GetMapping(value = "/commonCode/getCodeListAjax")
    @ResponseBody
    public String getCodeListAjax(CommonCodeEntity commonCodeEntity) {
        return commonCodeService.getCodeListAjax(commonCodeEntity);
    }

    /**
     * FUNCTION :: 양식 다운로드
     * @param gubun
     * @return
     */
    @GetMapping(value = "/file/formfileDownload")
    @ResponseBody
    public ResponseEntity<InputStreamResource> formfileDownload(String gubun) {
        return fileService.formfileDownload(gubun);
    }

    /**
     * FUNCTION :: 카테고리 리스트 조회 AJAX
     * @param category
     * @return
     */
    @GetMapping(value = "/category/getCategoryListAjax")
    @ResponseBody
    public String getCategoryListAjax(CategoryEntity category) {
        return categoryService.getCategoryListAjax(category);
    }

}