package com.project.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	
	/* 게시판 목록 리스트 조회 */
	@GetMapping("/noticeMain")
	public void uiNoticeMainGET(Model model) {
		//log.info("게시판 공지사항 페이지 진입");
		
		try {	
			Map<String,Object> param = new HashMap<String,Object>();
			param.put("bbsTyp", "02");	// 공지사항
			
			List<Map<String,Object>> list = service.selectBoardList(param);	// 게시판 조회
		
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.getStackTrace();
			System.err.println("에러발생!");
		}
	}
	
	// 게시판 등록 페이지 이동
//	@GetMapping("/noticeEnrollMain")
//	public void noticeEnrollMainGet() {
//		log.info("게시판 작성등록 진입");
//	}
	
	// 게시판 등록페이지 이동
	@GetMapping("/noticeEnrollMain")
	//@RequestMapping(value = "/noticeEnrollMain", method = RequestMethod.GET)
	public void selectBoardListMainGet(Model model) {
		
		
		log.info("게시판 작성등록 진입!");
	}
	
	/* 게시판 등록 */
	@PostMapping("/enroll")
	public String boardEnrollPOST(BoardVO board, RedirectAttributes rttr) {
		
		log.info("BoardVO : " + board);
		
		service.enroll(board);
		
		rttr.addFlashAttribute("result", "enrol success");
		
		return "redirect:/board/list";
	}
	
	// 게시판 저장
	@RequestMapping(value = "/boardEnroll", method = RequestMethod.POST)
	public String boardEnroll(@RequestParam Map<String,Object> param, RedirectAttributes rttr) {
		
		try {
			Map<String,Object> map = service.selectNewBbsNo(param);
			param.put("bbsNo", map.get("BBS_NO"));
			
			int result = service.boardEnroll(param);
			
		} catch (Exception e) {
			e.getStackTrace();
			System.err.println("에러발생!");
		}
		
		return "redirect:/board/noticeMain";
	}
}
