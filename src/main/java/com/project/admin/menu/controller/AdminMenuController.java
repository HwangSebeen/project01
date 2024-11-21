package com.project.admin.menu.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.admin.menu.service.AdminMenuService;

@Controller
@RequestMapping("/admin/menu/*")
public class AdminMenuController {
	private static final Logger log = LoggerFactory.getLogger(AdminMenuController.class);
	
	@Autowired
	AdminMenuService AdminMenuService;
	
	@GetMapping("/menuMain")
	public void adminMenuMain( ) {
		log.info("관리자 메뉴관리 진입");
	}
	
	@GetMapping("/menuInsertMain")
	public void adminMenuInsert( ) {
		log.info("관리자 메뉴등록 진입");
	}
}
