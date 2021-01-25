package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Entity.Post;
import com.example.demo.repository.PostRepository;
import com.example.demo.util.CommonUtils;

@Service
public class RepositoryService {
	
	@Autowired
	public PostRepository repository;
	
	public List<Post> findAllByOrderByTimeDesc(){
		return repository.findAllByOrderByTimeDesc();
	}
	
	public void save(Post post) {
		post.setContent(CommonUtils.XSSFilter(post.getContent()));
		post.setTitle(CommonUtils.XSSFilter(post.getTitle()));
		post.setWriter(CommonUtils.XSSFilter(post.getWriter()));
		repository.save(post);
	}

	public void deleteAllPost() {
		repository.deleteAll();
	}
	
	
}
