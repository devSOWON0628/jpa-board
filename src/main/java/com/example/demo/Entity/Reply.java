package com.example.demo.Entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;
@Getter
@NoArgsConstructor
@Setter
@Entity
public class Reply implements Serializable{
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private Integer reply_id;
	
	@Column(nullable = false, name="board_id")
	private String boardId;
	
	@Column(nullable = false)
	@NonNull
	private String content;
	
	@Column(nullable = false)
	@NonNull
	private Date time = new Date() ;

	@Builder
	public Reply(Integer reply_id, String boardId, @NonNull String content, @NonNull Date time) {
		super();
		this.reply_id = reply_id;
		this.boardId = boardId;
		this.content = content;
		this.time = time;
	}
	
	
}
