package com.example.demo.controller;

import java.util.Date;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.print.attribute.standard.PageRanges;
import javax.servlet.http.Cookie;

import org.apache.catalina.connector.Response;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.querydsl.QPageRequest;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Entity.Post;
import com.example.demo.Entity.Reply;
import com.example.demo.repository.PostRepository;
import com.example.demo.service.RepositoryService;
import com.example.demo.util.CommonUtils;
import com.example.demo.vo.PagingVO;

@RestController
public class MainController {
	
	@Autowired
	RepositoryService service;

	// 메인화면
//	@GetMapping
//	public ModelAndView boardList(@RequestParam(value="page", defaultValue="1", required=false) int thisPage
//								, @RequestParam(value="size", defaultValue="10", required=false) int perPageCnt) {
//		ModelAndView mv = new ModelAndView("main");
//		mv.addObject("paging", service.createVo(thisPage, perPageCnt)); 	
//		mv.addObject("all", service.getContents(thisPage, perPageCnt)); 
//		return mv;
//	}
	@GetMapping
	public ModelAndView boardList(Pageable pageable) {
		ModelAndView mv = new ModelAndView("main");
		mv.addObject("paging", service.createVo(pageable)); 	
		mv.addObject("all", service.getContents(pageable)); 
		return mv;
	}
	// 글 작성 폼
	@GetMapping("/form")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView("write");
		mv.addObject("post",service.getContentsInPage());
		return mv;
	}
	
	// 글 가져오기
	@GetMapping("/post")
	public ModelAndView postDetail(@RequestParam("num")Integer num) {
		ModelAndView mv = new ModelAndView("postDetail");
		mv.addObject("post",service.getOnePost(num));
		mv.addObject("re",service.getReply(num));
		return mv;
	}
		
	// 글 생성
	@PostMapping("/post")
	public void insertPost(Post post) {
		service.savePost(post);
	}
	
	// 글 수정
	@PutMapping("/post")
	public void updatePost(Post post) {
		service.savePost(post);
	}
	
	// 글 삭제
	@DeleteMapping(value = "/post", produces = "application/json;")
	public void deleteSelectedPost(@RequestBody List<Map<String,Object>> param) {
		service.deleteCheckedPosts(param);
	}
	
	@PostMapping("/reply")
	public void insertReply(Reply reply) {
		service.insertReply(reply);
	}
	
	@DeleteMapping("/reply")
	public void deleteReply(@RequestParam("id")String id) {
		service.deleteOnReply(id);
	}
	
}
