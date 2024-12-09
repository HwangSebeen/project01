package com.project.admin.menu.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
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
	public void adminMenuMain(Model model) {
		log.info("관리자 메뉴관리 진입");
		try {
			Map<String,Object> map = new HashMap<String,Object>();
			
			List<Map<String,Object>> list = adminMenuService.selectAdminMenuList(map);	// 조회
			model.addAttribute("list", list);
		} catch (Exception e) {
			e.getStackTrace();
			System.err.println("에러발생!");
		}
	}
	
	@GetMapping("/menuInsertMain")
	public void adminMenuInsert() {
		log.info("관리자 메뉴등록 진입");
	}
	
	// 게시판 저장
	@RequestMapping(value = "/menuInsert", method = RequestMethod.POST)
	public String menuInsert(@RequestParam(value ="menuImg", required=false) MultipartFile singleFile, @RequestParam Map<String,Object> param, Model model, RedirectAttributes rttr, HttpServletRequest request) throws IllegalStateException, IOException {
		if(singleFile.isEmpty()) {
			model.addAttribute("msg","메뉴 이미지 에러..");
		} else {
			param.put("menuTyp", "01");
			
			if(param.get("menuNo") == null) {
				Map<String,Object> map = adminMenuService.selectNewMenuNo(param);
				param.put("menuNo", map.get("MENU_NO"));
			}
			
			if(param.get("delYn") == null) {
				param.put("delYn", "N");
			}
			
			//String currentDir = System.getProperty("user.dir");
			
			//String filePath = currentDir + "\\src\\main\\resources\\webapp\\resources\\images\\menu";
			String filePath = "C:\\project2023\\workspace\\project2024_git\\src\\main\\webapp\\resources\\images\\menuImg";
			
			File mkdir = new File(filePath);
			if(!mkdir.exists()) mkdir.mkdirs();
			  
			String originFileName = singleFile.getOriginalFilename();
			
			String ext = originFileName.substring(originFileName.lastIndexOf("."));
			String savedName = UUID.randomUUID().toString().replace("-", "") + ext;
			  
			String menuImgPath = "/resources/images/menuImg/" + savedName;
			
			singleFile.transferTo(new File(filePath + "\\" + savedName));
			
			Map<String,Object> fileMap = new HashMap<String,Object>();
			
			fileMap.put("docId", savedName);				// 저장파일명
			fileMap.put("fileOriginName", originFileName);	// 실제파일명
			fileMap.put("fileExt", ext);
			fileMap.put("url", menuImgPath);	// 리소스/이미지/메뉴
			fileMap.put("fileTyp", "menu");
			fileMap.put("fileSeq", "1");
			
			param.put("fileMap", fileMap);
			param.put("docId", savedName);
			
			int result = adminMenuService.menuInsert(param);
			
			Map<String,Object> optMap = new HashMap<String,Object>();
			optMap.put("menuNo", param.get("menuNo"));
			optMap.put("delYn", param.get("delYn"));
			
			String[] menuOpt = request.getParameterValues("menuOpt");
			int optResult = 0;
			if(result > 0) {
				for(int i=0; i<menuOpt.length; i++) {
					optMap.put("optNo", menuOpt[i]);
					optResult = adminMenuService.saveMenuOpt(optMap);
				}
			} 
			
			if(result > 0 && optResult > 0) {
				model.addAttribute("msg","메뉴가 등록되었습니다.");
			} else {
				model.addAttribute("msg","메뉴 등록에 실패하였습니다.");
			}
			
		}
		
		model.addAttribute("url","/admin/menu/menuMain");
		return "/common/redirect";
		
	}
	
	// 메뉴옵션 목록 조회
	@RequestMapping("/selectOptList.do")
	public void selectOptList(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response){
		try {
			List<Map<String,Object>> options = adminMenuService.selectOptList(map);
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
	
	// 메뉴옵션 저장
	@RequestMapping("/saveOpt.do")
	public void saveOpt(@RequestParam Map map, HttpServletRequest request, HttpServletResponse response){
		try {
			int result = adminMenuService.saveOpt(map);
			
			PrintWriter pw = response.getWriter(); 
			
		    pw.print(result);
	        pw.flush();
	        pw.close();
	        
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/* 메뉴 조회 */
	@GetMapping("/menuDetailMain")
	public void menuDetailMain(int no, Model model) {
		try {	
			Map<String, Object> inputMap = new HashMap<String,Object>();
			inputMap.put("menuNo", no);
			
			Map<String,Object> param = adminMenuService.selectDetailMenu(inputMap);
			List<Map<String,Object>> list = adminMenuService.selectAdminMenuOptList(inputMap);	// 조회
			
			model.addAttribute("map", param);
			model.addAttribute("list", list);
			
		} catch (Exception e) {
			e.getStackTrace();
			System.err.println("에러발생!");
		}
	}
}
