package com.project.mapper;

import java.util.List;
import java.util.Map;

public interface LoginMapper {
	
	public int insertUser(Map param);
	
	public List selectOfficeList(Map map);
	
	public Map<String, Object> checkDupUserId(Map<String, Object> inputMap);
	
	public Map<String, Object> login(Map<String, Object> inputMap);
	
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
