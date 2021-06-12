package com.fridgeCare.fri.juhyun;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import javax.servlet.http.HttpSession;
@Controller
@RequestMapping("/juhyun/recipe")
public class ResipiController {
	@RequestMapping(value = "/resipiPage.fri" , method=RequestMethod.GET)
	public ModelAndView resipiPage(ModelAndView mv , HttpSession session) {
		
		mv.setViewName("king/tgether");
		return mv;
	}
	
}