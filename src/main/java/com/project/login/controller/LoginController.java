package com.project.login.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.controller.BoardController;
import com.project.login.service.LoginService;

@Controller
@RequestMapping("/login/*")
public class LoginController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	LoginService loginService;
	
	@GetMapping("/loginMain")
	public void login() {
		log.info("로그인 진입");
	}
	
	@PostMapping("/login")
	public void goToLogin(){
		System.err.println("dddd");
		
		int result = loginService.login();
		
		System.out.println("result : " + result);
		
		log.info("로그인 진입했는가");
	}
}
