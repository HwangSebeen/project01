package com.project.reserve.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.project.reserve.service.ReserveService;

@Controller
@RequestMapping("/reserve/*")
public class ReserveController {
private static final Logger log = LoggerFactory.getLogger(ReserveController.class);
	
	@Autowired
	ReserveService reserveService;
	
	@GetMapping("/reserveInsertMain")
	public void reserveMain( ) {
		log.info("예약하기 진입");
	}
}
