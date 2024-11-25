package com.project.mapper;

import java.util.Map;

import com.project.model.BoardVO;

public interface AdminMenuMapper {

	// 메뉴 등록
	public int menuInsert(Map<String,Object> map);
	
	// 메뉴번호 채번
	public Map<String,Object> selectNewMenuNo(Map<String,Object> map);
}
