package com.project.common.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.CommonDao;
import com.project.common.service.CommonService;

@Service
public class CommonServiceImpl implements CommonService{
	
	@Autowired
	private CommonDao commonDao;
	
	@Override
	public int insertFile(Map<String, Object> fileMap) {
		return commonDao.insert("com.project.mapper.CommonMapper.insertFile", fileMap);
	}

}
