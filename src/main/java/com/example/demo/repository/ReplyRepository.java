package com.example.demo.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.example.demo.Entity.Post;
import com.example.demo.Entity.Reply;

//public interface ReplyRepository extends CrudRepository<Reply, Integer>{
public interface ReplyRepository extends JpaRepository<Reply, Integer>{
	
	List<Reply> findByBoardId(String num);

}