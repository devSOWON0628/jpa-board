package com.example.demo.Entity;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;

@Data
@Entity
@NoArgsConstructor
public class Post implements Serializable {

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private String id;
	
	@Column
	@NonNull
	private String title;
	
	@Column
	@NonNull
	private String writer;
	
	@Column
	@NonNull
	private String content;
	
	@Column
	@NonNull
	private Date regTime = new Date();
}
