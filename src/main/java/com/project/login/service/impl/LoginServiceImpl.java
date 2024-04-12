package com.project.login.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.CommonDao;
import com.project.login.service.LoginService;
import com.project.model.BoardVO;

@Service
public class LoginServiceImpl implements LoginService{

	@Autowired
	CommonDao commonDao;
	
	@Override
	public int login() {
		//return commonDao.delete("com.project.mapper.BoardMapper.delete", map);
		return 0;
	}

	// 회원가입 저장
	@Override
	public int insertUser(Map map) {
		return commonDao.insert("com.project.mapper.LoginMapper.insertUser", map);
	}

	// 지점목록 가져오기
	@Override
	public List<Map<String,Object>> selectOfficeList(Map map) {
		return commonDao.selectList("com.project.mapper.LoginMapper.selectOfficeList", map);
	}

	@Override
	public Map<String, Object> checkDupUserId(Map<String, Object> inputMap) {
		return commonDao.selectOne("com.project.mapper.LoginMapper.checkDupUserId", inputMap);
	}

}
