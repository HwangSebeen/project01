package com.project.mapper;

import java.util.Map;

import com.project.model.BoardVO;

public interface BoardMapper {

	/* 게시판 등록 */
	public void enroll(BoardVO board);
	
	// 게시판 등록
	public int boardEnroll(Map<String,Object> map);
	
	// 게시판번호 채번
	public Map<String,Object> selectNewBbsNo(Map<String,Object> map);
	
	// 게시판 목록
	public Map<String,Object> selectBoardList(Map<String,Object> map);
	
	// 게시글 조회
	public Map<String,Object> selectDetail(Map<String,Object> map);
	
}
