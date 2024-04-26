package com.project.login.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.controller.BoardController;
import com.project.login.service.LoginService;

@Controller
@RequestMapping("/login/*")
public class LoginController { 

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	LoginService loginService;
	
	@GetMapping("/loginMain")
	public void login( ) {
		log.info("로그인 진입");
	}
	
	@RequestMapping("/login/login.do")
	public void goToLogin(@RequestParam Map<String, Object> map, Model model, 
			HttpServletRequest request, HttpServletResponse response, HttpSession session){
		Map<String, Object> output = new HashMap<String,Object>(); 
		try {	
			Map<String, Object> result = loginService.login(map);
			
			if(result == null) {
				output.put("failYn", "fail");
			} else {
				output.put("failYn", "success");
				output.put("CHKID", result.get("CHKID"));
				output.put("CHKPWD", result.get("CHKPWD"));
				output.put("USERLEAVEYN", result.get("USERLEAVEYN"));
				output.put("USERNM", result.get("USERNM"));
			}
			
			if(output.get("failYn") == "success" && output.get("CHKID") == "Y" && output.get("CHKPWD") == "Y") {
				session.setAttribute("userId", map.get("userId"));
				session.setAttribute("userNm", output.get("USERNM"));
			}
			
			JSONObject jsonObject = new JSONObject(output);

			PrintWriter pw;
			pw = response.getWriter();
		    pw.print(jsonObject.toString());
	        pw.flush();
	        pw.close();
		} catch (Exception e) {
			e.getStackTrace();
			System.err.println("에러발생!");
		}
	}
	
	@GetMapping("/join")
	public void join() {
	}
	
	@PostMapping("/join")
	public ModelAndView goToJoin(@RequestParam Map map, 
							RedirectAttributes rttr, HttpServletRequest request, HttpServletResponse response, ModelAndView mv){

		map.put("delYn", "N");
		int rslt = loginService.insertUser(map);
		
		if(rslt > 0) {
			System.err.println("성공ee!");
		} else {
			System.err.println("노성공!");
		}
		
		mv.setViewName("login");
		return mv;
	}
	
	// 관리지점 목록 조회
	@RequestMapping("/login/selectOfficeList.do")
	public void selectOfficeList(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response){
		System.err.println("3333");
		try {
			List<Map<String,Object>> options = loginService.selectOfficeList(map);
	        JSONArray jsonArray = new JSONArray();
	        
	        for (int i = 0; i < options.size(); i++) {
	            jsonArray.put(options.get(i));
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
	
	// 아이디 중복 체크
	@RequestMapping("/login/checkDupUserId.do")
	public String checkDupUserId(@RequestParam("userId") String userId, HttpServletRequest request, HttpServletResponse response){

		try {
			Map<String,Object> inputMap = new HashMap<String,Object>();
			inputMap.put("userId", userId);
			Map<String,Object> resultMap = loginService.checkDupUserId(inputMap);
			
			response.setCharacterEncoding("UTF-8");
			response.getWriter().print(resultMap.get("CNT"));
			
		} catch (IOException e) {
			e.printStackTrace();
		}
			
		return null;
	}
}
