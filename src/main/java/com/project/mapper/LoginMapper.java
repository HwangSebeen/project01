package com.project.mapper;

import java.util.List;
import java.util.Map;

public interface LoginMapper {
	
	public int insertUser(Map param);
	
	public List selectOfficeList(Map map);
	
	public Map<String, Object> checkDupUserId(Map<String, Object> inputMap);
	
	public Map<String, Object> login(Map<String, Object> inputMap);
	
}
