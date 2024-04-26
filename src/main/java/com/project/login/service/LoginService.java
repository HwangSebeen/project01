package com.project.login.service;

import java.util.List;
import java.util.Map;

public interface LoginService { 

	// 로그인
	Map<String, Object> login(Map<String, Object> inputMap);
	
	// 회원가입 
	int insertUser(Map map);
	
	// 지점목록 자져오기
	List<Map<String,Object>> selectOfficeList(Map map);

	// 아이디중복체크
	Map<String, Object> checkDupUserId(Map<String, Object> inputMap);

}
