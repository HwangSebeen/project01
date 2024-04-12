package com.project.common;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;

public interface CommonDao {
	public void setSqlSessionTemplate(SqlSessionTemplate template);

	public int insert(String queryId, Object parameterObject);

	public int update(String queryId, Object parameterObject);

	public int delete(String queryId, Object parameterObject);

	public Map<String, Object> selectOne(String queryId, Object parameterObject);

	public List<?> list(String queryId, Object parameterObject);	
	
	public List<Map<String, Object>> selectList(String queryId, Object parameterObject);
}
