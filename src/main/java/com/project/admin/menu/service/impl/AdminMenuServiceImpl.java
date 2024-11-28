package com.project.admin.menu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.admin.menu.service.AdminMenuService;
import com.project.common.CommonDao;
import com.project.common.service.CommonService;

@Service
public class AdminMenuServiceImpl implements AdminMenuService{

	@Autowired
	private CommonDao commonDao;
	
	@Autowired
	private CommonService commonService;
	
	// 메뉴순번구하기
	@Override
	public Map<String, Object> selectNewMenuNo(Map<String, Object> param) {
		return commonDao.selectOne("com.project.mapper.AdminMenuMapper.selectNewMenuNo", param);
	}
	
	// 메뉴저장
	@Override
	public int menuInsert(Map<String, Object> param) {
	
		Map<String,Object> fileMap = new HashMap<String,Object>();
		fileMap = (Map<String, Object>) param.get("fileMap");
		
		int fileResult = commonService.insertFile(fileMap);
		int result = 0;
		
		if(fileResult > 0) {
			result = commonDao.insert("com.project.mapper.AdminMenuMapper.menuInsert", param);
		}
		
		return result;
	}

	// 메뉴 목록 조회
	@Override
	public List<Map<String, Object>> selectAdminMenuList(Map<String, Object> param) {
		return commonDao.selectList("com.project.mapper.AdminMenuMapper.selectAdminMenuList", param);
	}

	

}
