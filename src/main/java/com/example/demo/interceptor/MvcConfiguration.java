package com.example.demo.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class MvcConfiguration implements WebMvcConfigurer{
	 @Override
	    public void addInterceptors(InterceptorRegistry registry) {
	        registry.addInterceptor(new LoggerInterceptor())
	                .addPathPatterns("/*")
	                .excludePathPatterns("/form/**"); // test 쪽도 예외처리
	    }
}
