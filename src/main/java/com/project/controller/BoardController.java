package com.project.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.model.BoardVO;
import com.project.service.BoardService;

@Controller
@RequestMapping("/board/*")
public class BoardController {

	private static final Logger log = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	/* 게시판 목록 페이지 접속 */
	@GetMapping("/list")
	// => @RequestMapping(value="list", method=RequestMethod.GET)
	public void boardListGET(Model model) {
		
		log.info("게시판 목록 페이지 진입");
		
	}
	
	
	/* 게시판 등록 페이지 접속 */
	@GetMapping("/enroll")
	// => @RequestMapping(value="enroll", method=RequestMethod.GET)
	public void boardEnrollGET() {
		
		log.info("게시판 등록 페이지 진입");
		
	}
	
	/* 게시판 등록 페이지 접속 */
	@GetMapping("/noticeMain")
	public void uiNoticeMainGET() {
		log.info("게시판 공지사항 페이지 진입");
	}
	
	// 게시판 등록 페이지 이동
	@GetMapping("/noticeEnrollMain")
	public void noticeEnrollMainGet() {
		log.info("게시판 작성등록 진입");
	}
	
	/* 게시판 등록 */
	@PostMapping("/enroll")
	public String boardEnrollPOST(BoardVO board, RedirectAttributes rttr) {
		
		log.info("BoardVO : " + board);
		
		service.enroll(board);
		
		rttr.addFlashAttribute("result", "enrol success");
		
		return "redirect:/board/list";
		
	}
	
	
}
