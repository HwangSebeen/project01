package com.project.login.service.impl;

import java.util.HashMap;
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
		System.out.println("impl까지 왔는가");  
		
		BoardVO vo = new BoardVO();
        vo.setBno(0);
        vo.setTitle("service test3");
        vo.setContent("service test4");
        vo.setWriter("service test5");
        
        Map<String, Object> map = new HashMap<String, Object>();
        
        map.put("bno", "1");
		
        System.out.println("map ::: " + map.toString());
        
		return commonDao.delete("com.project.mapper.BoardMapper.delete", map);
	}

}
