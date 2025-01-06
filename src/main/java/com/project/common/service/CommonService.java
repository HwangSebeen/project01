package com.project.common.service;

import java.util.List;
import java.util.Map;

public interface CommonService {

	public int insertFile(Map<String, Object> fileMap);

	public List<Map<String, Object>> selectCmnCdList(Map<String, Object> param);
}
