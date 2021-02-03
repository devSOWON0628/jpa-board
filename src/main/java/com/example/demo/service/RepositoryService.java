package com.example.demo.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.demo.Entity.Post;
import com.example.demo.Entity.Reply;
import com.example.demo.repository.PostRepository;
import com.example.demo.vo.PagingVO;

@Service
public class RepositoryService {
	@Autowired 
	PostRepository repository; 
	
	@Autowired
	ReplyRepository replyRepository;
	
	public void deleteCheckedPosts(List<Map<String, Object>> param) {
		for (Map<String, Object> map : param) {
			repository.deleteById(Integer.parseInt(map.get("id").toString()));
		}
	}

	public Object getContentsInPage() {
		return repository.findAllByOrderByTimeDesc();
	}

	public void savePost(Post post) {
		repository.save(post);
	}

	public void deleteAllPost() {
		repository.deleteAll();
	}

	public Post getOnePost(Integer num) {
		return repository.findById(num).get();
	}

	public PagingVO createVo(Pageable pageable) {
		return new PagingVO((int)repository.count(), pageable.getPageNumber(), pageable.getPageSize());
	}

	public void insertReply(Reply reply) {
		replyRepository.save(reply);
	}

	public Optional<Reply> findByAll(Integer num) {
		return replyRepository.findById(num);
	}

	public List<Reply> getReply(Integer num) {
		return replyRepository.findByBoardId(num+"");
	}

	public void deleteOnReply(String id) {
		replyRepository.deleteById(Integer.parseInt(id));
	}

	public List<Post> getContents(Pageable pageable) {
		return repository.findAll(PageRequest.of(pageable.getPageNumber()-1, pageable.getPageSize(), Sort.Direction.DESC , "time", "id")).getContent();
	}

	

	
}
