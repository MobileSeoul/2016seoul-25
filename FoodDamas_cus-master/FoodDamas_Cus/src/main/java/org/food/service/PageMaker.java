package org.food.service;

public class PageMaker {

	private int page;//현재페이지
	private int totalCount;//DB의 갯수
	private boolean prev, next;// 이전, 다음
	private int start, end;// 페이지의 시작과 끝

	public PageMaker(int page, int totalCount) {
		this.page=page;
		this.totalCount= totalCount;//게시물 총 갯수
		//end값 구하기

		//tempEnd 10개씩끊은거?
		//real진짜끝?

		double tempEnd=Math.ceil(page/10.0)*10;//만약 페이지가 3페이지면 10이다.
		//스타트구하기
		this.start=(int)tempEnd-9;

		double realEnd=Math.ceil(totalCount/10.0);//게시물 총 갯수를 10으로 나눈다.그후 올림

		System.out.println("start: "+this.start);
		System.out.println("tempEnd: "+tempEnd);
		System.out.println("realEnd: "+realEnd);
		
		if(realEnd>tempEnd){
			this.next=true;
			this.end=(int)tempEnd;
		}
		else{
			this.end=(int)realEnd;
		}
		if(start!=1){
			this.prev=true;
		}

		System.out.println("End: "+this.end);
		System.out.println("Prev: "+this.prev);
		System.out.println("Next: "+this.next);
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getEnd() {
		return end;
	}
	public void setEnd(int end) {
		this.end = end;
	}

	public static void main(String[] args) {
		PageMaker p= new PageMaker(131, 141);
		
	}
}
