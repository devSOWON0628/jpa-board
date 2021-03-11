package com.example.demo.service;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Slice;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;

import com.example.demo.Entity.Post;
import com.example.demo.Entity.Reply;
import com.example.demo.repository.PostRepository;
import com.example.demo.repository.ReplyRepository;
import com.example.demo.vo.PagingVO;

@Service
public class RepositoryService {
	@Autowired 
	PostRepository postRepository; 
	
	@Autowired
	ReplyRepository replyRepository;
	
	public void deleteCheckedPosts(List<Map<String, Object>> param) {
		for (Map<String, Object> map : param) {
			postRepository.deleteById(Integer.parseInt(map.get("id").toString()));
		}
	}
	
	public Object getContentsInPage() {
		return postRepository.findAllByOrderByTimeDesc();
	}

	public void savePost(Post post) {
		postRepository.save(post);
	}

	public void deleteAllPost() {
		postRepository.deleteAll();
	}

	public Post getOnePost(Integer num) {
		return postRepository.findById(num).get();
	}

	public PagingVO createVo(Pageable pageable) {
		return new PagingVO((int)postRepository.count(), pageable.getPageNumber(), pageable.getPageSize());
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
		Page<Post> result = postRepository.findAll(PageRequest.of(pageable.getPageNumber()-1	// 현재 몇 페이지인지 0부터 시작하기 때문에 1빼줌
																, pageable.getPageSize()		// 한 페이지당 몇개를 보여줄지
																, Sort.Direction.DESC 			// 정렬을 어떻게
																, "time"						// 무엇으로 정리할것인지
																, "id"));
		return result.getContent();
	}

}
