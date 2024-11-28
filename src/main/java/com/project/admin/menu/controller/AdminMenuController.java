package com.project.admin.menu.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.project.admin.menu.service.AdminMenuService;

@Controller
@RequestMapping("/admin/menu/*")
public class AdminMenuController {
	private static final Logger log = LoggerFactory.getLogger(AdminMenuController.class);
	
	@Autowired
	AdminMenuService adminMenuService;
	
	@GetMapping("/menuMain")
	public void adminMenuMain( ) {
		log.info("관리자 메뉴관리 진입");
	}
	
	@GetMapping("/menuInsertMain")
	public void adminMenuInsert( ) {
		log.info("관리자 메뉴등록 진입");
	}
	
	// 게시판 저장
	@RequestMapping(value = "/menuInsert", method = RequestMethod.POST)
	public String menuInsert(@RequestParam(value ="menuImg", required=false) MultipartFile singleFile, @RequestParam Map<String,Object> param, Model model, RedirectAttributes rttr, HttpServletRequest request) throws IllegalStateException, IOException {
		if(singleFile.isEmpty()) {
			model.addAttribute("msg","로그아웃 되었습니다.");
			model.addAttribute("url","/");
			return "/common/redirect";
		} else {
			param.put("menuTyp", "01");
			Map<String,Object> map = adminMenuService.selectNewMenuNo(param);
			param.put("menuNo", map.get("MENU_NO"));
			
			//String currentDir = System.getProperty("user.dir");
			
			//String filePath = currentDir + "\\src\\main\\resources\\webapp\\resources\\images\\menu";
			String filePath = "C:\\project2023\\workspace\\project2024_git\\src\\main\\webapp\\resources\\images\\menuImg";
			
			File mkdir = new File(filePath);
			if(!mkdir.exists()) mkdir.mkdirs();
			  
			String originFileName = singleFile.getOriginalFilename();
			
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String savedName = UUID.randomUUID().toString().replace("-", "") + ext;
			  
			String menuImage = "/images/menu/" + savedName;
			
			singleFile.transferTo(new File(filePath + "\\" + savedName));
			
			Map<String,Object> fileMap = new HashMap<String,Object>();
			
			fileMap.put("docId", savedName);				// 저장파일명
			fileMap.put("fileOriginName", originFileName);	// 실제파일명
			fileMap.put("fileExt", ext);
			fileMap.put("url", filePath);
			fileMap.put("fileTyp", "menu");
			fileMap.put("fileSeq", "1");
			
			param.put("fileMap", fileMap);
			param.put("docId", savedName);
			param.put("delYn", 'N');
			
			int result = adminMenuService.menuInsert(param);
			
			model.addAttribute("msg","메뉴가 등록되었습니다.");
			model.addAttribute("url","/admin/menu/menuMain");
			return "/common/redirect";
			
			//return "redirect:/admin/menu/menuMain";
		}
		
	}
}
