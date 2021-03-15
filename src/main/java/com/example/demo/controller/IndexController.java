package com.example.demo.controller;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@Controller
public class IndexController {
	@GetMapping("")
	public String forCookie(HttpServletRequest req, HttpServletResponse res) {
		Cookie myCookie = new Cookie("auth", "true");
		myCookie.setMaxAge(1000);
		myCookie.setPath("/"); // 모든 경로에서 접근 가능 하도록 설정
		res.addCookie(myCookie);
		return "redirect:/api";
	}
}
