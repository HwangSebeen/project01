package com.project.common.impl;

import java.util.List;

import javax.annotation.Resource;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.common.CommonDao;

@Repository("CommonDao")
public class CommonDaoImpl implements CommonDao {
	
//	@Resource(name="stForCommon") protected 
	@Autowired
	private SqlSessionTemplate template;
	
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	
	@Override
	public Object insert(String queryId, Object parameterObject)
	{
		return template.insert(queryId, parameterObject);
	}

	@Override
	public int update(String queryId, Object parameterObject)
	{
		return template.update(queryId, parameterObject);
	}

	@Override
	public int delete(String queryId, Object parameterObject)
	{
		return template.delete(queryId, parameterObject);
	}

	@Override
	public Object selectOne(String queryId, Object parameterObject)
	{
		return template.selectOne(queryId, parameterObject);
	}

	@Override
	public List<?> list(String queryId, Object parameterObject)
	{
		return template.selectList(queryId, parameterObject);
	}
}
