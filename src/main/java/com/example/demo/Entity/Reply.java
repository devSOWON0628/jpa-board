package com.example.demo.Entity;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.*;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
@Data
@NoArgsConstructor
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
	
	
}
