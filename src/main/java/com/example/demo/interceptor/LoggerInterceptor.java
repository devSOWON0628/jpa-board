package com.example.demo.interceptor;

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
		Cookie[] cookies = request.getCookies() ;
		if(cookies == null) {
			response.sendRedirect("https://gw.gsitm.com/");
			return false;
		}
		logger.info("Interceptor > preHandle cookie : "+cookies[0].getValue());
		return true;
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
		// Servlet 3.0 부터 비동기 요청이 가능해짐에 따라 비동기 요청 시 PostHandle와 afterCompletion메서드를 수행하지 않고 이 메서드를 수행하게 됩니다. (Spring에서 제공함)
		super.afterConcurrentHandlingStarted(request, response, handler);
		logger.info("Interceptor > afterConcurrentHandlingStarted");
	}
    
    
}
