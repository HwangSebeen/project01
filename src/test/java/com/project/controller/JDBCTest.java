package com.project.controller;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

public class JDBCTest {
	static { 
        try { 
            Class.forName("oracle.jdbc.driver.OracleDriver"); 
        } catch(Exception e) { 
            e.printStackTrace(); 
        } 
    } 
    
    @Test 
    public void testConnection() { 
        try(Connection con = DriverManager.getConnection( 
                "jdbc:oracle:thin:@localhost:1521:XE", 
                "project2023_dev", 
                "project2023_dev")){ 
            System.out.println(con); 
        } catch (Exception e) { 
        	System.out.println("fail"); 
        } 
    
    }    
}
