package com.project.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.admin.service.AdminService;

@Controller
@RequestMapping("/admin/*")
public class AdminController {
	@Autowired
	AdminService adminService;
	
	@GetMapping("/adminMain")
	public void adminMain() {
	}
}
