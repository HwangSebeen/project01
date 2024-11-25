package com.project.admin.menu.service;

import java.util.Map;

public interface AdminMenuService {

	public int menuInsert(Map<String, Object> param);

	public Map<String, Object> selectNewMenuNo(Map<String, Object> param);

}
