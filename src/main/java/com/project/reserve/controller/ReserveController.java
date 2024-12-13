package com.project.reserve.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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
}
