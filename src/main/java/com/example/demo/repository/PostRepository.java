package com.example.demo.repository;

import java.util.List;
import java.util.Optional;

import org.springframework.data.repository.PagingAndSortingRepository;

import com.example.demo.Entity.Post;

public interface PostRepository extends PagingAndSortingRepository<Post, String>{

	List<Post> findAllByOrderByRegTimeDesc ();
	
}
