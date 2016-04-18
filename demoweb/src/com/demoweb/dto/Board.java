package com.demoweb.dto;

import java.sql.Date;
import java.util.List;

public class Board {
	
	private int boardNo;
	private String writer;
	private String title;
	private String content;
	private Date regDate;
	private int readCount;
	private boolean deleted;
	
	//board테이블과 boardcomment 테이블의 1 : Many 관계를 구현하는 필드 
	private List<BoardComment> comments;
	
	private int group;
	private int step;
	private int depth;
	
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}
	public boolean isDeleted() {
		return deleted;
	}
	public void setDeleted(boolean deleted) {
		this.deleted = deleted;
	}
	public int getGroup() {
		return group;
	}
	public void setGroup(int group) {
		this.group = group;
	}
	public int getStep() {
		return step;
	}
	public void setStep(int step) {
		this.step = step;
	}
	public int getDepth() {
		return depth;
	}
	public void setDepth(int depth) {
		this.depth = depth;
	}
	
	public List<BoardComment> getComments() {
		return comments;
	}
	public void setComments(List<BoardComment> comments) {
		this.comments = comments;
	}
}
