package com.project.admin.menu.controller;

import java.io.File;
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
	public String menuInsert(@RequestParam(value ="menuImg", required=false) MultipartFile singleFile, @RequestParam Map<String,Object> param, Model model, RedirectAttributes rttr, HttpServletRequest request) {
		if(singleFile.isEmpty()) {
			model.addAttribute("msg","로그아웃 되었습니다.");
			model.addAttribute("url","/");
			return "/common/redirect";
		} else {
			String currentDir = System.getProperty("user.dir");
			
			String filePath = currentDir + "\\src\\main\\resources\\webapp\\resources\\images\\menu";
			
			File mkdir = new File(filePath); if(!mkdir.exists()) mkdir.mkdirs();
			  
			String originFileName = singleFile.getOriginalFilename();
			
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String savedName = UUID.randomUUID().toString().replace("-", "") + ext;
			  
			String menuImg = "/images/uploadFiles/menu/" + savedName;
			
			param.put("docId", savedName);
			
			//int result = adminMenuService.menuInsert(param);
			
			/*
			 *originFileName : me_picture.jpg
			ext : .jpg
			savedName : 01ced4f4aaa440d2b35145740edc00fa.jpg
			menuImg : /images/uploadFiles/menu/01ced4f4aaa440d2b35145740edc00fa.jpg
			filePath : C:\project2023\sts-3.9.18.RELEASE\src\main\resources\webapp\resources\images\uploadFiles\menu
			currentDir : C:\project2023\sts-3.9.18.RELEASE
			 * 
			 * */
			
			 System.out.println("originFileName : " + originFileName);
			 System.out.println("ext : " + ext);
			 System.out.println("savedName : " + savedName);
			 System.out.println("menuImg : " + menuImg);
			 System.out.println("filePath : " + filePath);
			
			// 첨부파일 테이블에도 저장해야됨
			
			return "";
		}
		
	}
}
