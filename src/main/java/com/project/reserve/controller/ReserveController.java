package com.project.reserve.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
<<<<<<< HEAD
	@PostMapping("/selectReserveList")
=======
	@GetMapping("/selectReserveList")
>>>>>>> branch 'SEBEEN' of https://github.com/HwangSebeen/project01.git
    @ResponseBody
    public void selectReserveList(HttpServletResponse response, HttpServletRequest request) throws IOException {
		HttpSession session = request.getSession();
		String userId = (String) session.getAttribute("userId");
		
		Map<String, Object> inputMap = new HashMap<String, Object>();
		inputMap.put("userId", userId);
		
        List<Map<String,Object>> list = reserveService.selectReserveList(inputMap);
       
        /* 쿼리에서 앨리어스 별칭 start 를 쓰면 안되는 경우로
         * 따로 값을 가져와서 임의로 start 키를 만들어서 리스트에 add 하기로함 */
        List<Map<String,Object>> rslt = new ArrayList<Map<String, Object>>();
        System.err.println("list : " + list.toString());
        for(Map<String, Object> map : list) {
        	
        	Map<String, Object> temp = new HashMap<String, Object>();
        	
        	temp.put("start", map.get("RESV_ST_DTE"));
        	temp.put("RESV_NO", map.get("RESV_NO"));
        	temp.put("RESV_DTE", map.get("RESV_DTE"));
        	temp.put("USER_ID", map.get("USER_ID"));
        	temp.put("title", map.get("TITLE"));
        	temp.put("RESV_CONTENT", map.get("RESV_CONTENT"));
        	temp.put("RESV_ST_TIME", map.get("RESV_ST_TIME"));
        	temp.put("end", map.get("RESV_ED_DTE"));
        	temp.put("RESV_ED_TIME", map.get("RESV_ED_TIME"));
        	temp.put("OFFICE_NO", map.get("OFFICE_NO"));
        	temp.put("RESV_PHONE_NUM", map.get("RESV_PHONE_NUM"));
        	
        	rslt.add(temp);
        }
        System.err.println("rslt : " + rslt.toString());
        JSONArray jsonArray = new JSONArray();
        
        for (int i = 0; i < rslt.size(); i++) {
            jsonArray.put(rslt.get(i));
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
