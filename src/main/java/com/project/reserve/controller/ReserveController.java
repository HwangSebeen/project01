package com.project.reserve.controller;

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
import org.json.JSONObject;
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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

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
	
	@GetMapping("/reserveInsertP")
	public void reserveInsertP( ) {
		log.info("예약하기 신청 진입");
	}
	
	@PostMapping("/reserveInsertP")
	public void reserveInsertP1(HttpServletRequest request) {
		log.info("예약하기 신청 진입");
	}
	
	@GetMapping("/selectReserveList")
    @ResponseBody
    public void selectReserveList(HttpServletResponse response) throws IOException {
        List<Map<String,Object>> list = reserveService.selectReserveList();
 
        JSONObject jsonObj = new JSONObject();
        JSONArray jsonArray = new JSONArray();
 
        HashMap<String, Object> hash = new HashMap<>();
        
        for (int i = 0; i < list.size(); i++) {
            jsonArray.put(list.get(i));
        }
        

        PrintWriter pw;
		pw = response.getWriter();
		
	    pw.print(jsonArray.toString());
        pw.flush();
        pw.close();
    }
	
	// 예약 저장
	@RequestMapping(value = "/insertReserve", method = RequestMethod.POST)
	public String insertReserve( @RequestParam Map<String,Object> param, Model model, RedirectAttributes rttr, HttpServletRequest request) throws IllegalStateException, IOException {
		
		int result = reserveService.insertReserve(param);
		
		if(result > 0 ) {
			model.addAttribute("msg","예약 신청 되었습니다.");
		} else {
			model.addAttribute("msg","예약 신청에 실패하였습니다.");
		}
			
		model.addAttribute("url", "/reserve/reserveInsertMain");
		return "/common/redirect";
		
	}
}
