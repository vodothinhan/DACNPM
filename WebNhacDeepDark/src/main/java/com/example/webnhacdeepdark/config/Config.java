package com.example.webnhacdeepdark.config;

import com.example.webnhacdeepdark.permit.FilterUser;
import org.springframework.boot.web.servlet.FilterRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class Config {
    @Bean
    public FilterRegistrationBean<FilterUser> registerFilter(){
        FilterRegistrationBean<FilterUser> registrationBean = new FilterRegistrationBean<>() ;
        registrationBean.setFilter(new FilterUser());
        registrationBean.addUrlPatterns("/admin/*");
        return registrationBean ;
    }

}
