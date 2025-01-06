package com.project.common.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.project.common.service.CommonService;

@Controller
@RequestMapping("/common/*")
public class CommonController {
	@Autowired
	CommonService commonService;
	
	// 공통코드 목록 조회
	@RequestMapping("/selectCmnCdList")
	@SuppressWarnings("unchecked")
	public void selectCmnCdList(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response){
		try {
			
			System.out.println("map : " + map.toString());
			List<Map<String,Object>> cmnList = commonService.selectCmnCdList(map);
	        JSONArray jsonArray = new JSONArray();
	        
	        for (int i = 0; i < cmnList.size(); i++) {
	            jsonArray.put(cmnList.get(i));
	        }

	        PrintWriter pw;
			pw = response.getWriter();
			
		    pw.print(jsonArray.toString());
	        pw.flush();
	        pw.close();
		} catch (IOException e) {
			e.printStackTrace(); 
		}
	}
}
