package com.fridgeCare.fri.king;


import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;
@Controller
@RequestMapping("/king")
public class KingController {
	int cnt;
	static Logger logger = LoggerFactory.getLogger(KingController.class);
	@Autowired
	DAO masterdao;
	@RequestMapping("/joinpage.fri")
	public String joinpage() {
		
		return "hh/joinpage";
	}
	@RequestMapping("/pwfind.fri")
	public String pwfind() {
		
		return "hh/pwfind";
	}
	@RequestMapping("/deleteR")
	public ModelAndView myinfo(ModelAndView mv , RedirectView rv , HttpSession s , int bno) {
		rv.setUrl("/fri/hh/main.fri?deleteR");
		String sid = (String) s.getAttribute("SID");
		String owner = masterdao.getOwnerID(bno);
		System.out.println(sid);
		System.out.println(owner);
		if(sid.equals(owner)) {
			cnt = masterdao.updateBisshow(bno);
			if(cnt == 0) {
				rv.setUrl("/fri/juhyun/recipe/resipiPage.fri?Dfail&bno=" + bno);
			}else {
				logger.info("board " + bno + " deleted");
			}
		}else {
			rv.setUrl("/fri/juhyun/recipe/resipiPage.fri?Dfail&bno=" + bno);
		}
		mv.setView(rv);
		return mv;
	}
	@RequestMapping("/idCheck.fri")
	@ResponseBody
	public String idcheck(String id) {
		String view = "{\"result\" : \"NO\"}";
		cnt = 0;
		if(cnt == 0) {
			view = "{\"result\" : \"OK\"}";
		}
		return view;
	}
	@RequestMapping("/mailcheck.fri")
	@ResponseBody
	public HashMap<String, String> mailcheck(String mail) {
		cnt = 0;
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("result", (cnt == 0? "OK" : "NO"));
		return map;
	}
	@RequestMapping("/logout.fri")
	public ModelAndView logout(ModelAndView mv , RedirectView rv , HttpSession s) {
		rv.setUrl("/fri/");
		s.removeAttribute("SID");
		mv.setView(rv);
		return mv;
	}
	@RequestMapping("/pwfindproc.fri")
	@ResponseBody
	public String pwfindproc(String AN) {
		String view = "{\"result\" : \"OK\"}";
		cnt = 0;
		if(cnt == 0) {
			view = "{\"result\" : \"NO\"}";
		}
		return view;
	}
	@RequestMapping("/pwchange.fri")
	public String pwchange(HttpSession s) {
		return "hh/pwchange";
	}
	@RequestMapping("/secession")
	public ModelAndView secession(ModelAndView mv , RedirectView rv , HttpSession s) {
		rv.setUrl("/fri/hh/main.fri?secession");
		String sid = (String) s.getAttribute("SID");
		cnt = 0;
		if(cnt == 0) {
			rv.setUrl("/fri/hh/myinfo.fri?secessionfail");
		}else {
			s.removeAttribute("SID");
			logger.info(sid + "has leave fri");
		}
		mv.setView(rv);
		return mv;
	}
	@RequestMapping("/partner.fri")
	@ResponseBody
	public String partnercall(HttpSession s) {
		String view = "{\"result\" : \"OK\"}";
//		String sid = (String) s.getAttribute("SID");
		cnt = 0;
		if(cnt < 1) {
			view = "{\"result\" : \"NO\"}";
		}
		return view;
	}
	@RequestMapping("/partnerproc")
	@ResponseBody
	public String partnerproc(HttpSession s) {
		String view = "{\"result\" : \"OK\"}";
//		String sid = (String) s.getAttribute("SID");
		cnt = 0;
		if(cnt < 1) {
			view = "{\"result\" : \"NO\"}";
		}else {
			cnt = 0;
			if(cnt == 0) {
				view = "{\"result\" : \"NO\"}";
			}
		}
		return view;
	}
}