package com.fridgeCare.fri.hyunuk;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.fridgeCare.fri.hh.vo.InputVO;


@Controller
@RequestMapping("/hyunuk")
public class HyunukController {
	@Autowired
	SearchDao sDao;
	int cnt;
	@RequestMapping("/search.fri")
	@ResponseBody
	@CrossOrigin(origins = "http://localhost:8080")
	public boolean getList(InputVO ivo) {
		cnt = sDao.logincheck(ivo);
		if (cnt == 1) return true;
		return false;
	}
	@RequestMapping(value="/selected.fri", method = RequestMethod.POST)
	@ResponseBody
	public String SelectedIngred() {
		return "{\"result\":\"OK\"}";
	}
	
}
