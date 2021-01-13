package com.fridgeCare.fri.hyunuk;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import com.fridgeCare.fri.hyunuk.vo.GetVO;
import com.fridgeCare.fri.hyunuk.vo.IngredVO;
import com.fridgeCare.fri.hyunuk.vo.SearchVO;


@Controller
@RequestMapping("/hyunuk")
public class HyunukController {
	
	@Autowired
	SearchDao sDao;
	
	// 페이지 요청
	@RequestMapping("/search.fri")
	public ModelAndView getList(ModelAndView mv, SearchVO sVO, IngredVO inVO, HttpSession session) {
		mv.setViewName("hyunuk/search");
		session.setAttribute("HOME", "hyunuk/search.fri?");
		List<IngredVO> ingred = sDao.getIngredient(inVO);
		mv.addObject("LIST", ingred);
		return mv;
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
	
	/*
	 * @RequestMapping(value="/titleSearch.fri", method = RequestMethod.POST) public
	 * Map<String, Object> titleSearch(String getContext, int total){ Map<String,
	 * Object> map3 = new HashMap<String, Object>(); String cont = "";
	 * System.out.println("컨텍스트 : " + getContext);
	 * 
	 * SearchVO sVO = new SearchVO();
	 * 
	 * 
	 * total = sDao.searchCNT(cont);
	 * 
	 * 
	 * 
	 * if(getContext == null) { cont += "%" + getContext + "%"; }
	 * 
	 * 
	 * sVO.setSearch(cont); sVO.setTotal(total);
	 * 
	 * 
	 * 
	 * 
	 * map3.put("search", getContext); map3.put("total", total);
	 * 
	 * List<SearchVO> tLIST = sDao.titleSearch(map3);
	 * 
	 * 
	 * return map3; }
	 */
	
	
	
}
