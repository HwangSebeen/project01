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
			// 메뉴 저장
			result = commonDao.insert("com.project.mapper.AdminMenuMapper.menuInsert", param);
		}
		
		return result;
	}
	
	// 메뉴에 대한 옵션 등록
	@Override
	public int saveMenuOpt(Map<String, Object> param) {
		return commonDao.insert("com.project.mapper.AdminMenuMapper.saveMenuOpt", param);
	}

	// 메뉴 목록 조회
	@Override
	public List<Map<String, Object>> selectAdminMenuList(Map<String, Object> param) {
		return commonDao.selectList("com.project.mapper.AdminMenuMapper.selectAdminMenuList", param);
	}

	// 옵션 조회
	@Override
	public List<Map<String, Object>> selectOptList(Map param) {
		return commonDao.selectList("com.project.mapper.AdminMenuMapper.selectOptList", param);
	}

	// 옵션 저장
	@Override
	public int saveOpt(Map param) {
		return commonDao.insert("com.project.mapper.AdminMenuMapper.saveOpt", param);
	}

	@Override
	public Map<String, Object> selectDetailMenu(Map<String, Object> inputMap) {
		return commonDao.selectOne("com.project.mapper.AdminMenuMapper.selectDetailMenu", inputMap);
	}

	@Override
	public List<Map<String, Object>> selectAdminMenuOptList(Map<String, Object> param) {
		return commonDao.selectList("com.project.mapper.AdminMenuMapper.selectAdminMenuOptList", param);
	}
<<<<<<< HEAD
=======

	
>>>>>>> refs/heads/SEBEEN

}
