package com.example.demo;

import static org.junit.jupiter.api.Assertions.assertEquals;

import org.junit.jupiter.api.Test;
import org.springframework.boot.test.context.SpringBootTest;

@SpringBootTest
class JpaStudyBoardApplicationTests {

	@Test
	void contextLoads() {
		
	}
	@Test
	public void testAdd() {
	    assertEquals(42, Integer.sum(19, 23));
	}
}
