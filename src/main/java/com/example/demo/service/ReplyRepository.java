package com.example.demo.service;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.PagingAndSortingRepository;

import com.example.demo.Entity.Post;
import com.example.demo.Entity.Reply;

public interface ReplyRepository extends CrudRepository<Reply, Integer>{
	List<Reply> findByBoardId(String num);

}