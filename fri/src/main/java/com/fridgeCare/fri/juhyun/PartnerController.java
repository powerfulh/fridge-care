package com.fridgeCare.fri.juhyun;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.fridgeCare.fri.juhyun.vo.PartnerVO;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
@Controller
@RequestMapping("/juhyun/partner")
public class PartnerController {
	
	@Autowired
	DAO pDao;
	
	// 보드 리스트 전담 처리 함수
	@RequestMapping(value="/partner.fri", method=RequestMethod.GET)
	public ModelAndView partnerBoard(ModelAndView mv, PageUtil page) {
		int total = pDao.getBoardCnt();
		
		page.setTotalCount(total);
		page.setPage();
		
		System.out.println("start: " + page.getStartCont() + " endcont: " + page.getEndCont());
		System.out.println(page.getNowPage());
		List<PartnerVO> board = pDao.getBoardInfo(page);
		
		mv.addObject("BOARD",board);
		mv.addObject("PAGE", page);
		
		mv.setViewName("juhyun/partner/partner");
		return mv;
	}
	
	
}
/*
 * 	req.setAttribute("BOARD", board);
	req.setAttribute("pagelist", pagelist);
	req.setAttribute("pagination", page);
 */