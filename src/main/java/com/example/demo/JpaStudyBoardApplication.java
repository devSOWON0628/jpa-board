package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class JpaStudyBoardApplication {

	public static void main(String[] args) {
		SpringApplication.run(JpaStudyBoardApplication.class, args);
	}

	
	/*  직접 쿼리를 작성하지 않고 객체를 통해 쉽게 필요한 데이터에 접근 가능함
		명명법을 잘 따르면 쉽게 쿼리 생성 가능
		페이징을 위한 interface(CRUD인터페이스를 포함함)가 있음
		QueryDSL을 활용하면 조건이 가변적으로 바뀌는 쿼리 실행 가능*/
	
}
