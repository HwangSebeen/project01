package com.project.admin.menu.service;

import java.util.List;
import java.util.Map;

public interface AdminMenuService { 

	public int menuInsert(Map<String, Object> param);

	public Map<String, Object> selectNewMenuNo(Map<String, Object> param);

	public List<Map<String, Object>> selectAdminMenuList(Map<String, Object> param);

	public List<Map<String, Object>> selectOptList(Map map);

	public int saveOpt(Map map);

	public Map<String, Object> selectDetailMenu(Map<String, Object> inputMap);

	public List<Map<String, Object>> selectAdminMenuOptList(Map<String, Object> inputMap);

	public int saveMenuOpt(Map<String, Object> param);

}
