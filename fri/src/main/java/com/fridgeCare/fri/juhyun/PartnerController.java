package com.fridgeCare.fri.juhyun;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
@Controller
@RequestMapping("/juhyun/partner")
public class PartnerController {
	@Autowired
	DAO pDao;
	@RequestMapping(value="/partner.fri", method=RequestMethod.GET)
	public ModelAndView partnerBoard(ModelAndView mv, HttpSession s) {
		s.setAttribute("HOME", "juhyun/partner/partner.fri?");
		mv.setViewName("juhyun/partner/partner");
		return mv;
	}
	
}