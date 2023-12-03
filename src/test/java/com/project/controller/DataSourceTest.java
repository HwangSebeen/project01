package com.project.controller;
import java.sql.Connection;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class DataSourceTest {
 
    @Autowired
    private DataSource dataSource;
    
    @Autowired private 
    SqlSessionFactory sqlSessionFactory;
    
    @Test
    public void testConnection() {
      // 데이터소스 커넥션풀 테스트
//        try(Connection con = dataSource.getConnection();){
//            
//            System.out.println("con = " + con);
//            
//        } catch(Exception e) {
//            
//            e.printStackTrace();
//            
//        }
    	
    	// 마이바티스 테스트
    	 try(
                 Connection con = dataSource.getConnection();
                 SqlSession session = sqlSessionFactory.openSession();
             
             ){
             
                 System.out.println("con = " + con);
                 System.out.println("session = " + session);
             
             } catch(Exception e) {
             
                 e.printStackTrace();
             
             }
        
    }
    
}