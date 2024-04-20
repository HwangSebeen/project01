package com.project.service;


import java.util.Map;

import com.project.model.BoardVO;

public interface BoardService {

	/* 게시판 등록 */
	public void enroll(BoardVO board);

	public int boardEnroll(Map<String, Object> param);

	public Map<String, Object> selectNewBbsNo(Map<String, Object> param);

	
//	/* 게시판 목록 */
//	public List<BoardVO> getList();
//	
//	/* 게시판 목록(페이징 적용) */
//	public List<BoardVO> getListPaging(Criteria cri);
//	
//	/* 게시판 조회 */
//	public BoardVO getPage(int bno);	
//	
//	/* 게시판 수정 */
//	public int modify(BoardVO board);
//	
//	/* 게시판 삭제 */
//	public int delete(int bno);
//	
//	/* 게시판 총 갯수 */
//	public int getTotal(Criteria cri);
	
}
