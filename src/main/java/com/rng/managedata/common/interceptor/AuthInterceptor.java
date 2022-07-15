package com.rng.managedata.common.interceptor;

import com.rng.managedata.database.jpa.entity.common.AccountEntity;
import com.rng.managedata.database.mybatis.dto.common.MenuCode;
import com.rng.managedata.database.mybatis.mapper.common.MenuCodeMapper;
import lombok.RequiredArgsConstructor;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;

@RequiredArgsConstructor
public class AuthInterceptor extends HandlerInterceptorAdapter {

    private final Logger logger = LoggerFactory.getLogger(this.getClass());

    private final MenuCodeMapper menuCodeMapper;

    /**
     * LINE :: Controller 접근 전
     * @param request
     * @param response
     * @param handler
     * @return
     * @throws Exception
     */
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        logger.info("==================== InterCeptor preHandle BEGIN ====================");
        logger.info("Request URI ===> " + request.getRequestURI());

        HttpSession session = request.getSession();
        boolean isAjax = Boolean.parseBoolean(request.getHeader("isAjax"));
        AccountEntity accountInfo = (AccountEntity) session.getAttribute("accountInfo");

        // LINE :: 세션 체크하여 null인 경우 로그인페이지 이동
        if (session == null || accountInfo == null) {
            response.sendRedirect("/login/form");
            return false;
        }

        MenuCode menuCode = menuCodeMapper.findOneByUrl(request.getRequestURI());
        if(menuCode != null){
            MenuCode activeMenu = menuCodeMapper.findByCode(menuCode.getCode());    // LINE :: 현재 메뉴 코드를 기준으로 active 처리 및 좌측 메뉴 조회를 위한 데이터 조회
            String topCode = ( activeMenu.getCode1() != null ? activeMenu.getCode1() : ( activeMenu.getCode2() != null ? activeMenu.getCode2() : activeMenu.getCode3() ) );
            List<MenuCode> leftMenu;
            List<MenuCode> headerMenu;
            headerMenu = menuCodeMapper.findTopMenu();                                   // LINE :: 1뎁스 메뉴 조회
            leftMenu = menuCodeMapper.findLeftMenu(topCode); // LINE :: 좌측 메뉴 조회


            session.setAttribute("headerMenu", headerMenu);
            session.setAttribute("activeMenu", activeMenu);
            session.setAttribute("leftMenu", leftMenu);
        }


        return super.preHandle(request, response, handler);
    }

    /**
     * LINE :: Controller 경유한 뒤 뷰로 결과를 전달하기 전
     * @param request
     * @param response
     * @param handler
     * @param modelAndView
     * @throws Exception
     */
    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
        logger.info("==================== InterCeptor postHandle BEGIN ====================");
    }
}