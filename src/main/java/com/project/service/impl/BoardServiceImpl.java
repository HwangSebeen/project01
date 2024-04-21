package com.project.service.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.CommonDao;
import com.project.mapper.BoardMapper;
import com.project.model.BoardVO;
import com.project.service.BoardService;

@Service
public class BoardServiceImpl implements BoardService {

//	@Autowired
//	private BoardMapper mapper;

	@Autowired
	private CommonDao commonDao;
	
	/* 게시판 등록 */
	@Override
	public void enroll(BoardVO board) {
		
//		mapper.enroll(board);
		
		commonDao.insert("com.project.mapper.BoardMapper.enroll", board);
		
	}

	// 게시판 등록
	@Override
	public int boardEnroll(Map<String, Object> param) {
		return commonDao.insert("com.project.mapper.BoardMapper.boardEnroll", param);
	}

	// 게시판번호 채번
	@Override
	public Map<String, Object> selectNewBbsNo(Map<String, Object> param) {
		return commonDao.selectOne("com.project.mapper.BoardMapper.selectNewBbsNo", param);
	}

	// 게시판 목록 조회
	@Override
	public List<Map<String, Object>> selectBoardList(Map<String, Object> param) {
		return commonDao.selectList("com.project.mapper.BoardMapper.selectBoardList", param);
	}

	// 게시판 게시글 조회
	@Override
	public Map<String, Object> selectDetail(Map<String, Object> param) {
		return commonDao.selectOne("com.project.mapper.BoardMapper.selectDetail", param);
	}

//	/* 게시판 목록 */
//	@Override
//	public List<BoardVO> getList() {
//		
//		return mapper.getList();
//	}
//	
//	/* 게시판 목록(페이징 적용) */
//	@Override
//	public List<BoardVO> getListPaging(Criteria cri) {
//		
//		return mapper.getListPaging(cri);
//	}	
//	
//	/* 게시판 조회 */
//	@Override
//	public BoardVO getPage(int bno) {
//		 
//		return mapper.getPage(bno);
//	}
//
//	
//	/* 게시판 수정 */
//	@Override
//	public int modify(BoardVO board) {
//		
//		return mapper.modify(board);
//	}
//
//	/* 게시판 삭제 */
//	@Override
//	public int delete(int bno) {
//		
//		return mapper.delete(bno);
//	}
//	
//	/* 게시물 총 갯수 */
//	@Override
//	public int getTotal(Criteria cri) {
//		
//		return mapper.getTotal(cri);
//	}		
	
}
