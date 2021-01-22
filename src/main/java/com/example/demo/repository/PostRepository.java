package com.example.demo.repository;

import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.PagingAndSortingRepository;
import org.springframework.data.repository.query.Param;

import com.example.demo.Entity.Post;

public interface PostRepository extends PagingAndSortingRepository<Post, String>{

	List<Post> findAllByOrderByTimeDesc ();
	
	@Transactional
	@Modifying // select 문이 아님을 나타낸다
	@Query(value="UPDATE Post t SET t.title = :title , t.writer = :writer , t.content = :content , t.time = now() WHERE (t.id = :id)", nativeQuery = true)
	void updatePost(@Param("title") String title, @Param("writer")String writer, @Param("content")String content,@Param("id")String id);
	
}
