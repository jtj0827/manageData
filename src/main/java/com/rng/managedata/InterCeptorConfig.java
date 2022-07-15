package com.rng.managedata;

import com.rng.managedata.common.interceptor.AuthInterceptor;
import com.rng.managedata.database.mybatis.mapper.common.MenuCodeMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class InterCeptorConfig implements WebMvcConfigurer {

    @Autowired
    private MenuCodeMapper menuCodeMapper;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(new AuthInterceptor(menuCodeMapper))
                .addPathPatterns("/**")
                .excludePathPatterns("/error", "/resources/**", "/login/*", "/logout", "/error/*");
    }
}
