package com.project.admin.menu.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.admin.menu.service.AdminMenuService;
import com.project.common.CommonDao;

@Service
public class AdminMenuServiceImpl implements AdminMenuService{

	@Autowired
	private CommonDao commonDao;
	
	@Override
	public int menuInsert(Map<String, Object> param) {
		return commonDao.insert("com.project.mapper.AdminMenuMapper.menuInsert", param);
	}

}
