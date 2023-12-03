package com.project.common;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;

public interface CommonDao {
	public void setSqlSessionTemplate(SqlSessionTemplate template);

	public Object insert(String queryId, Object parameterObject);

	public int update(String queryId, Object parameterObject);

	public int delete(String queryId, Object parameterObject);

	public Object selectOne(String queryId, Object parameterObject);

	public List<?> list(String queryId, Object parameterObject);	
}
