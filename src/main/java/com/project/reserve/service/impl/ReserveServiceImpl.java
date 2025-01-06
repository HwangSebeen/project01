package com.project.reserve.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.common.CommonDao;
import com.project.reserve.service.ReserveService;

@Service
public class ReserveServiceImpl implements ReserveService {

	@Autowired
	private CommonDao commonDao;  
	
	// 예약 리스트 조회
	@Override
	public List<Map<String, Object>> selectReserveList(Map<String, Object> param) {
		return commonDao.selectList("com.project.mapper.ReserveMapper.selectReserveList", param);
	}

	// 예약 저장
	@Override
	public int insertReserve(Map<String, Object> param) {
		return commonDao.insert("com.project.mapper.ReserveMapper.insertReserve", param);
	}

}
