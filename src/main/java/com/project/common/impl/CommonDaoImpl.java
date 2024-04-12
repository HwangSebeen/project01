package com.project.common.impl;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.project.common.CommonDao;

@Repository("CommonDao")
public class CommonDaoImpl implements CommonDao {
	
//	@Resource(name="stForCommon") protected 
	@Autowired
	private SqlSessionTemplate template;
	
	@Autowired
	private SqlSession SqlSession;
	
	@Override
	public void setSqlSessionTemplate(SqlSessionTemplate template) {
		this.template = template;
	}
	
	@Override
	public int insert(String queryId, Object parameterObject)
	{
		System.err.println("queryId :: " + queryId);
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
	public Map<String, Object> selectOne(String queryId, Object parameterObject)
	{
		return template.selectOne(queryId, parameterObject);
	}

	@Override
	public List<?> list(String queryId, Object parameterObject)
	{
		return template.selectList(queryId, parameterObject);
	}
	
	public List<Map<String,Object>> selectList(String queryId, Object parameterObject)
	{
		return SqlSession.selectList(queryId, parameterObject);
	}
}
