package com.project.mapper;

import java.util.Map;

public interface ReserveMapper {
	
	// 예약리스트 조회
	public void selectReserveList();
	
	// 예약 저장
	public int insertReserve(Map param);
}
