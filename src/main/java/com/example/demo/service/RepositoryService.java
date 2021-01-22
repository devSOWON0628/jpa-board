package com.example.demo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.example.demo.Entity.Post;
import com.example.demo.repository.PostRepository;

@Service
public class RepositoryService {
	
	@Autowired
	public PostRepository repository;
	
	public List<Post> findAllByOrderByTimeDesc(){
		return repository.findAllByOrderByTimeDesc();
	}
	
	public void save(Post post) {
		repository.save(post);
	}

	public void deleteAllPost() {
		repository.deleteAll();
	}
	
	
}
