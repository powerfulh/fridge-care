package com.fridgeCare.fri.hyunuk;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import com.fridgeCare.fri.hyunuk.vo.GetVO;
import com.fridgeCare.fri.hyunuk.vo.SearchVO;


@Controller
@RequestMapping("/hyunuk")
public class HyunukController {
	@Autowired
	SearchDao sDao;
	// 페이지 요청
	@RequestMapping("/search.fri")
	@ResponseBody
	@CrossOrigin(origins = "http://localhost:8080")
	public String getList() {
		System.out.println("call from vue");
		return "{\"result\":\"OK\"}";
	}
	// 선택된 값 요청
	@RequestMapping(value="/selected.fri", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> SelectedIngred(String[] Situat, String[] Category, String SelIng) {
		String situ = "";
		String CAT = "";
		if(Situat == null || Situat.length == 0) {
			situ = "'SELF','DRINK','SIDE','FULL'";
		}else {
			for(int i = 0; i < Situat.length; i++) {
				situ += "'"+(String)Situat[i] + "',";
			}
			situ = situ.substring(0,situ.length()-1);
		}
		if(Category == null || Category.length == 0) {
			CAT = "'KR','CH','JP','WE','FU'";
		}else {
			for(int i = 0; i < Category.length; i++) {
				CAT += "'"+(String)Category[i] + "',";
			}
			CAT = CAT.substring(0,CAT.length()-1);
		}
		if(SelIng == "") {
			SelIng = "|";
		}
		GetVO gVO = new GetVO();
		gVO.setCat(CAT);
		gVO.setSitu(situ);
		gVO.setSeling(SelIng);
		Map<String, String> map = new HashMap<String, String>();
		map.put("CAT", CAT);
		map.put("situ", situ);
		map.put("SelIng", SelIng);
		List<SearchVO> sLIST = sDao.getRecipelist(map);
		System.out.println(sLIST.size());
		Map<String,Object> map2 = new HashMap<String, Object>();
		map2.put("sLIST",sLIST);
		return map2;
	}
	
}
