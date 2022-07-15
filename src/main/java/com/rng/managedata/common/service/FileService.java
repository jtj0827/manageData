package com.rng.managedata.common.service;

import com.rng.managedata.common.values.FileUseGubun;
import com.rng.managedata.database.jpa.entity.common.FileEntity;
import com.rng.managedata.database.jpa.repository.common.FileRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.InputStreamResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.*;

@Service
@RequiredArgsConstructor
public class FileService extends CommonService {

    @Value("${managedata.editor.path}")
    private String EDITOR_PATH;

    @Value("${managedata.file.path}")
    private String ATTACH_PATH;

    @Value("${managedata.formfile.path}")
    private String FORMFILE_PATH;

    private final FileRepository fileRepository;

    private final ServletContext servletContext;

    private final HttpSession session;

    /**
     * FUNCTION :: 에디터 이미지 업로드
     * @param response
     * @param uploadFile
     */
    public void editorImageUpload(HttpServletResponse response, MultipartFile uploadFile) {
        String uuid = UUID.randomUUID().toString();
        String dirPath = EDITOR_PATH + File.separator + getUploadPath();
        String uploadPath = dirPath + File.separator + uuid;
        String fileName = uploadFile.getOriginalFilename();
        String fileExt = fileName.substring( fileName.lastIndexOf(".") + 1 );

        try {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html;charset=utf-8");

            byte[] fileToBytes = uploadFile.getBytes();

            File dir = new File(dirPath);
            // LINE :: 업로드 할 디렉터리 없는 경우 디렉터리 생성
            if (!dir.exists()) { dir.mkdirs(); }

            OutputStream out = new FileOutputStream( new File(uploadPath) );
            out.write( fileToBytes );
            out.flush();

            FileEntity fileEntity = new FileEntity(dirPath, uuid, fileName, uploadFile.getSize(), "", FileUseGubun.EDITOR.getText(), fileExt, 0, getLoginInfo().getId());
            fileRepository.save(fileEntity);

            // LINE :: 에디터 이미지 연결값 세팅을 위한 세션처리
            String fileIdxs = session.getAttribute("editorImageIdxs") != null ? session.getAttribute("editorImageIdxs").toString() : "";
            session.setAttribute("editorImageIdxs", "".equals(fileIdxs) ? fileEntity.getIdx() : (fileIdxs+","+fileEntity.getIdx()));

            PrintWriter printWriter = response.getWriter();
            String rtnFileUrl = "/file/download/" + fileEntity.getIdx();

            printWriter.println( "{\"filename\" : \"" + fileName + "\", \"uploaded\" : 1, \"url\" : \"" + rtnFileUrl +  "\"}" );
            printWriter.flush();

            out.close();
            printWriter.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String handleFileUpload(MultipartFile uploadFile) {
        Map<String, Object> rtnMap = returnMap();

        String uuid = UUID.randomUUID().toString();
        String dirPath = EDITOR_PATH + File.separator + getUploadPath();
        String uploadPath = dirPath + File.separator + uuid;
        String fileName = uploadFile.getOriginalFilename();
        String fileExt = fileName.substring( fileName.lastIndexOf(".") + 1 );

        try{
            File dir = new File(dirPath);
            // LINE :: 업로드 할 디렉터리 없는 경우 디렉터리 생성
            if (!dir.exists()) { dir.mkdirs(); }

            OutputStream out = new FileOutputStream( new File(uploadPath) );
            out.write( uploadFile.getBytes() );
            out.flush();

            FileEntity fileEntity = new FileEntity(dirPath, uuid, fileName, uploadFile.getSize(), "", FileUseGubun.EDITOR.getText(), fileExt, 0, getLoginInfo().getId());
            fileRepository.save(fileEntity);

            // LINE :: 에디터 이미지 연결값 세팅을 위한 세션처리
            String fileIdxs = session.getAttribute("editorImageIdxs") != null ? session.getAttribute("editorImageIdxs").toString() : "";
            session.setAttribute("editorImageIdxs", "".equals(fileIdxs) ? fileEntity.getIdx() : (fileIdxs+","+fileEntity.getIdx()));
            String rtnFileUrl = "/file/download/" + fileEntity.getIdx();

            rtnMap.put("uploaded", 1);
            rtnMap.put("url", rtnFileUrl);
            rtnMap.put("fileName", fileName);

        } catch (Exception e){
            rtnMap.put("uploaded", 0);
            rtnMap.put("error", "{'message': '" + e.getMessage() + "'}");
        }

        return jsonFormatTransfer(rtnMap);
    }



    /**
     * FUNCTION :: 파일 다운로드
     * @param fileEntity
     * @return
     */
    public ResponseEntity<InputStreamResource> download(FileEntity fileEntity) {
        try {
            // LINE :: User-Agent 값 받기 위해 HttpServletRequest 객체 선언
            HttpServletRequest request = ((ServletRequestAttributes) RequestContextHolder.getRequestAttributes()).getRequest();
            String reqHeader = request.getHeader("User-Agent");

            fileEntity = fileRepository.findByIdx(fileEntity.getIdx());
            String fileName = fileEntity.getName();
            // LINE :: IE와 파폭, (크롬, 사파리)로 구분. (크롬, 사파리)를 기본 값으로 사용.
            String resHeader = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
            if(reqHeader.contains("Trident")) {
                resHeader = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
            }else if(reqHeader.contains("Firefox"))
                resHeader = '\"' + new String(fileName.getBytes("UTF-8"), "ISO-8859-1") + '\"';


            String bindPath = fileEntity.getPath();
            String mineType = servletContext.getMimeType(fileName);
            mineType = mineType == null ? "application/octet-stream" : mineType;
            MediaType mediaType = MediaType.parseMediaType(mineType);
            File file = new File(bindPath + File.separator + fileEntity.getUuid());
            InputStreamResource resource = new InputStreamResource(new FileInputStream(file));
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + resHeader) // Content-Disposition
                    .contentType(mediaType) // Content-Type
                    .contentLength(file.length()) // Contet-Length

                    .body(resource);
        } catch (FileNotFoundException e) {
            log.info("FileNotFoundException ::" + e.getMessage());
            return null;
        } catch (UnsupportedEncodingException e) {
            log.info("UnsupportedEncodingException ::" + e.getMessage());
            return null;
        }
    }

    /**
     * FUNCTION :: 단일 파일 업로드 (한 데이터 당 하나의 파일만 등록 가능한 경우 사용)
     * @param file
     * @param refGubun
     * @param useGubun
     * @param refIdx
     */
    public void uniqueFileUpload(MultipartFile file, String refGubun, String useGubun, Long refIdx) {
        // LINE :: 업로드된 파일이 존재하지 않는 경우 실행하지 않음
        if (file == null || file.getSize() == 0) { return; }

        // LINE :: 연결 고유값, 사용 구분, 파일 구분값을 기준으로 이전에 등록된 첨부파일 목록 조회
        List<FileEntity> fileList = fileRepository.findByRefIdxAndRefGubunAndUseGubun(refIdx, refGubun, useGubun);

        // LINE :: 조회된 첨부파일 존재하는 경우 삭제 처리
        if (fileList != null && fileList.size() > 0) {
            for (FileEntity fileEntity : fileList) { fileRepository.delete(fileEntity); }
        }
        this.fileUpload(file, refGubun, useGubun, refIdx);
    }

    /**
     * FUNCTION :: 단일 첨부파일 업로드 공통 로직 (웹)
     * @param file
     * @param refGubun
     * @param useGubun
     * @param refIdx
     */
    public void fileUpload(MultipartFile file, String refGubun, String useGubun, Long refIdx) {
        List<MultipartFile> files = new ArrayList<>();
        files.add(file);
        this.fileUpload(files, refGubun, useGubun, refIdx);
    }

    /**
     * FUNCTION :: 첨부파일 업로드 공통 로직 (웹)
     * @param files
     * @param refGubun
     * @param useGubun
     * @param refIdx
     */
    public void fileUpload(List<MultipartFile> files, String refGubun, String useGubun, Long refIdx) {
        this.fileUpload(files, refGubun, useGubun, refIdx, getLoginInfo().getId());
    }

    /**
     * FUNCTION :: 첨부파일 업로드 공통 로직 (API)
     * @param files
     * @param refGubun
     * @param useGubun
     * @param refIdx
     * @param regId
     */
    public void fileUploadAPI(List<MultipartFile> files, String refGubun, String useGubun, Long refIdx, String regId) {
        this.fileUpload(files, refGubun, useGubun, refIdx, regId);
    }

    /**
     * FUNCTION :: 파일 업로드 공통 로직 (다중)
     * @param files
     * @param refGubun
     * @param useGubun
     * @param refIdx
     */
    private void fileUpload(List<MultipartFile> files, String refGubun, String useGubun, Long refIdx, String regId) {
        if (files == null || files.size() == 0) { return; }

        try {
            String dirPath = ATTACH_PATH + File.separator + getUploadPath();
            for (MultipartFile uploadFile : files) {
                if (uploadFile != null && uploadFile.getSize() > 0) {
                    String uuid = UUID.randomUUID().toString();
                    String fileName = uploadFile.getOriginalFilename();
                    String fileExt = fileName.substring( fileName.lastIndexOf(".") + 1 );
                    String uploadPath = dirPath + File.separator + uuid;

                    File dir = new File(dirPath);
                    // LINE :: 업로드 할 디렉터리 없는 경우 디렉터리 생성
                    if (!dir.exists()) { dir.mkdirs(); }

                    File targetFile = new File(uploadPath);
                    uploadFile.transferTo(targetFile);

                    if (targetFile.exists()) {
                        FileEntity fileEntity = new FileEntity(dirPath, uuid, fileName, uploadFile.getSize(), refGubun, useGubun, fileExt, refIdx, regId);
                        fileRepository.save(fileEntity);
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * FUNCTION :: 파일 업로드 Path 리턴 함수
     * @return
     */
    private String getUploadPath() {
        Date date = new Date();
        SimpleDateFormat format = new SimpleDateFormat("yyyy" + File.separator + "MM" + File.separator + "dd");
        return format.format(date);
    }

    /**
     * FUNCTION :: 에디터 이미지 연결값 세팅
     * @param refGubun
     * @param refIdx
     */
    public void setEditorImageRefInfo(String refGubun, Long refIdx) {
        String editorImageIdxs = session.getAttribute("editorImageIdxs") != null ? session.getAttribute("editorImageIdxs").toString() : "";
        if (!"".equals(editorImageIdxs)) {
            List<FileEntity> fileList = new ArrayList<>();
            for (String fileIdx : editorImageIdxs.split(",")) {
                FileEntity file = fileRepository.findByIdx(Long.parseLong(fileIdx));
                file.setRefGubun(refGubun);
                file.setRefIdx(refIdx);
                fileList.add(file);
            }
            fileRepository.saveAll(fileList);
        }
        session.removeAttribute("editorImageIdxs");
    }

    /**
     * FUNCTION :: 양식 다운로드
     * @param gubun
     * @return
     */
    public ResponseEntity<InputStreamResource> formfileDownload(String gubun) {
        try {
            String path = FORMFILE_PATH + File.separator;
            String fileName = "";

            if ("dns_record".equals(gubun)) {
                fileName = "dns_record_form.xlsx";
            } else if ("unused_id".equals(gubun)) {
                fileName = "unused_id_form.xlsx";
            }
            path += fileName;

            File formfile = new File(path);
            if (!formfile.exists()) { return null; }

            String mineType = servletContext.getMimeType(fileName);
            mineType = mineType == null ? "application/octet-stream" : mineType;
            MediaType mediaType = MediaType.parseMediaType(mineType);

            InputStreamResource resource = new InputStreamResource(new FileInputStream(formfile));
            return ResponseEntity.ok()
                    .header(HttpHeaders.CONTENT_DISPOSITION, "attachment;filename=" + new String(fileName.getBytes("UTF-8"), "ISO-8859-1")) // Content-Disposition
                    .contentType(mediaType) // Content-Type
                    .contentLength(formfile.length()) // Contet-Length
                    .body(resource);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public String getFileContents(File file) throws Exception {
        String contents = "";

        FileReader fileReader = new FileReader(file);
        BufferedReader bufReader = new BufferedReader(fileReader);

        String line = "";
        while ((line = bufReader.readLine()) != null) {
            contents += line + "\r\n";
        }

        fileReader.close();
        bufReader.close();

        return contents;
    }

}