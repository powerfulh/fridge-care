package com.fridgeCare.fri.hyunuk;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
@RequestMapping("/hyunuk")
public class HyunukController {
	@Autowired
	SearchDao sDao;
	@RequestMapping("/search.fri")
	@ResponseBody
	@CrossOrigin(origins = "http://localhost:8080")
	public String getList(String data1) {
		System.out.println(data1);
		
		return "{\"result\":\"OK\"}";
	}
	@RequestMapping(value="/selected.fri", method = RequestMethod.POST)
	@ResponseBody
	public String SelectedIngred() {
		return "{\"result\":\"OK\"}";
	}
	
}
