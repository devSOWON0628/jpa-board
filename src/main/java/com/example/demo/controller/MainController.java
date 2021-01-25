package com.example.demo.controller;

import java.util.Date;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.demo.Entity.Post;
import com.example.demo.repository.PostRepository;
import com.example.demo.util.CommonUtils;
import com.example.demo.vo.PagingVO;

@RestController
public class MainController {
	
	@Autowired 
	PostRepository repository; 

	@GetMapping("")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView("write");
		mv.addObject("post",repository.findAllByOrderByTimeDesc());
		return mv;
	}
	
	// post ajax
	@PostMapping("/insert/post")
	public void insertPost(Post post) {
		post.setContent(CommonUtils.XSSFilter(post.getContent()));
		post.setTitle(CommonUtils.XSSFilter(post.getTitle()));
		post.setWriter(CommonUtils.XSSFilter(post.getWriter()));
		repository.save(post);
	}
	
	@DeleteMapping("/delete/post")
	public void deleteAllPost() {
		repository.deleteAll();
	}
	
	@GetMapping("/home")
	public ModelAndView boardList(@RequestParam(value="page", defaultValue="1", required=false)int thisPage
								, @RequestParam(value="per", defaultValue="10", required=false)int perPageCnt) {
		ModelAndView mv = new ModelAndView("main");
		PagingVO vo = new PagingVO((int)repository.count(), thisPage, perPageCnt); 
		mv.addObject("paging", vo); 	
		mv.addObject("all", repository.findAll((PageRequest.of(thisPage-1,perPageCnt, Sort.Direction.DESC ,"time"))).getContent());
		
		return mv;
	}
	
	@GetMapping("/read")
	public ModelAndView postDetail(@RequestParam("num")String num) {
		ModelAndView mv = new ModelAndView("postDetail");
		mv.addObject("post",(repository.findById(num)).get());
		return mv;
	}

	@PutMapping("/update/post")
	public void updatePost(Post post) {
		repository.updatePost(post.getTitle(), post.getWriter(), post.getContent(), post.getId());
	}
	
	@DeleteMapping("/delete/post/one")
	public void deletePost(@RequestParam("num")String num) {
		repository.deleteById(num);
	}
}
