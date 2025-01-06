package com.project.mapper;

import java.util.List;
import java.util.Map;

public interface CommonMapper {
	/* 파일 등록 */
	public void insertFile(Map<String, Object> inputMap);
	
	/* 공통코드 조회 */
	public List<Map<String, Object>> selectCmnCdList(Map<String, Object> inputMap);
}
