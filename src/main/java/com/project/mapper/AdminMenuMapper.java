package com.project.mapper;

import java.util.Map;

import com.project.model.BoardVO;

public interface AdminMenuMapper { 

	// 메뉴 등록
	public int menuInsert(Map<String,Object> map);
	
	// 메뉴번호 채번
	public Map<String,Object> selectNewMenuNo(Map<String,Object> map);
	
	// 메뉴 목록
	public Map<String,Object> selectAdminMenuList(Map<String,Object> map);
	
	// 메뉴 옵션 목록
	public Map<String,Object> selectOptList(Map<String,Object> map);
	
	// 옵션 등록
	public int saveOpt(Map<String,Object> map);
	
	// 메뉴에 대한 옵션 등록
	public int saveMenuOpt(Map<String,Object> map);
	
	// 메뉴 조회
	public Map<String,Object> selectDetailMenu(Map<String,Object> map);
	
	// 메뉴 옵션 조회
	public Map<String,Object> selectAdminMenuOptList(Map<String,Object> map);
}
