package com.example.demo.vo;

import lombok.Data;
import lombok.ToString;

@ToString
@Data
public class PagingVO {
	
	private int nowPage 	 // 현재페이지
			  , startPage    // 현재의 첫번째 페이지
			  , endPage      // 현재의 끝 페이지
			  , total  		 // 전체 item 개수
			  , cntPerPage   // 한 페이지에 몇개의 item을 넣을지
			  , lastPage  	 // 전체의 제일 마지막 페이지
			  , start  		 // 이번페이지 아이템들의 start rownum
			  , end; 		 // 이번페이지 아이템들의 end rownum
	
	private int cntPage = 5; // 아래 보이는 페이징 갯수 
	
	public PagingVO() {}
	
	public PagingVO(int total, int nowPage, int cntPerPage) {
		setNowPage(nowPage);
		setCntPerPage(cntPerPage);
		setTotal(total);
		
		calcLastPage(getTotal(), getCntPerPage());
		calcStartEndPage(getNowPage(), cntPage);
		calcStartEnd(getNowPage(), getCntPerPage());
	}
	
	// 제일 마지막 페이지 계산
	public void calcLastPage(int total, int cntPerPage) {
		setLastPage((int) Math.ceil((double)total / (double)cntPerPage));
	}
	// 시작, 끝 페이지 계산
	public void calcStartEndPage(int nowPage, int cntPage) {
		setEndPage(((int)Math.ceil((double)nowPage / (double)cntPage)) * cntPage);
		if (getLastPage() < getEndPage()) {
			setEndPage(getLastPage());
		}
		setStartPage(getEndPage() - cntPage + 1);
		if (getStartPage() < 1) {
			setStartPage(1);
		}
	}
	// DB 쿼리에서 사용할 start, end값 계산
	public void calcStartEnd(int nowPage, int cntPerPage) {
		setEnd(nowPage * cntPerPage); 			// 그 페이지 내 item의 end rownum
		setStart(getEnd() - cntPerPage + 1);	// 그 페이지 내 item의 start rownum
	}
	
}
