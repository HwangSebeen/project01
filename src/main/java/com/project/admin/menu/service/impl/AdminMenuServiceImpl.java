package com.project.admin.menu.service.impl;

import java.util.HashMap;
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

	@Override
	public Map<String, Object> selectNewMenuNo(Map<String, Object> param) {
		return commonDao.selectOne("com.project.mapper.AdminMenuMapper.selectNewMenuNo", param);
	}

}
