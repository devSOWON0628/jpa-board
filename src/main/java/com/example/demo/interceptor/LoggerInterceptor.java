package com.example.demo.interceptor;

import java.util.Iterator;
import java.util.Optional;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoggerInterceptor extends HandlerInterceptorAdapter  {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	@Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		// 컨트롤러(즉 RequestMapping이 선언된 메서드 진입) 실행 직전에 동작.
		Cookie[] cookies =  request.getCookies();
		if(cookies == null) {
			logger.info("쿠키 없을 무...");
			response.sendRedirect("/");
			return false;
		}
		for (Cookie cookie : cookies) {
			if("auth".equals(cookie.getName()) && "true".equals(cookie.getValue())) {
				logger.info("쿠키 있을 유");
				return true;
			}
		}
		logger.info("쿠키가 없어서 갔다왔어용");
		response.sendRedirect("/");
		return false;
		
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
    	// 컨트롤러 진입 후 view가 랜더링 되기 전 수행이 됩니다.
    	logger.info("Interceptor > postHandle");
    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object object, Exception arg3) throws Exception {
    	// 컨트롤러 진입 후 view가 정상적으로 랜더링 된 후 제일 마지막에 실행이 되는 메서드입니다.
    	logger.info("Interceptor > afterCompletion");
    }

	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
		super.afterConcurrentHandlingStarted(request, response, handler);
		logger.info("Interceptor > afterConcurrentHandlingStarted");
	}

}
