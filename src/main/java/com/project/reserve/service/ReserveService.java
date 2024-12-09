package com.project.reserve.service;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

public interface ReserveService {

	// 예약 리스트 조회
	List<Map<String, Object>> selectReserveList();

}
