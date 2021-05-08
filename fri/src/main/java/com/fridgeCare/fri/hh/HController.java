package com.fridgeCare.fri.hh;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fridgeCare.fri.hh.util.Navermail;
import com.fridgeCare.fri.hh.vo.InputVO;
import com.fridgeCare.fri.hh.vo.LatelyUploadVO;
import com.fridgeCare.fri.hh.vo.MemberVO;
import com.fridgeCare.fri.hh.vo.SideRankVO;
@Controller
@RequestMapping("/hh")
public class HController {
	int cnt;
	static Logger logger = LoggerFactory.getLogger(HController.class);
	@Autowired
	DAO hdao;
	String home;
	@RequestMapping("/main.fri")
	public String getMain(HttpSession s , HttpServletRequest request) {
//		String sid = (String) s.getAttribute("SID");
		LatelyUploadVO luvo = hdao.getLUVO();
		SideRankVO srvo = hdao.getWR();
		s.setAttribute("HOME", "hh/main.fri?");
		try {
			if(luvo.getTname() == null) {
				luvo.setTname("noimage.jpg");
			}
			if(luvo.getSavename() == null) {
				luvo.setSavename("noimage.jpg");
			}
			s.setAttribute("LUVO", luvo);
		}catch(NullPointerException e) {
//			e.printStackTrace();
			System.out.println("no any board or boardpart");
		}
		s.setAttribute("WVO", srvo);
		srvo = hdao.getMR();
		s.setAttribute("MVO", srvo);
		return "hh/main";
	}
	@RequestMapping("/joinpage.fri")
	public String joinpage() {
		
		return "hh/twitch";
	}
	@RequestMapping("/pwfind.fri")
	public String pwfind() {
		
		return "hh/pwfind";
	}
	@RequestMapping("/ajaxtest.fri")
	@ResponseBody
	public String ajaxtest(String[] ajaxdata) {
		String view = "{\"result\" : \"NO\"}";
		System.out.println(ajaxdata[0]);
		return view;
	}
	@RequestMapping("/logincheck.fri")
	public ModelAndView logincheck(ModelAndView mv , RedirectView rv , HttpSession s , InputVO ivo , String idcookie) {
		home = (String) s.getAttribute("HOME");
		rv.setUrl("/fri/" + home + "setrid=" + ivo.getInputid());
		cnt = hdao.logincheck(ivo);
		if(cnt == 0) {
			rv.setUrl("/fri/" + home + "fail");
		}else {
			s.setAttribute("SID", ivo.getInputid());
			cnt = hdao.submitCondate(ivo.getInputid());
			if(cnt == 0) {
				System.out.println("submit condate fail");
			}
			if(idcookie == null) {
				rv.setUrl("/fri/" + home + "removerid");
			}
			MemberVO mvo = hdao.getmvo(ivo.getInputid());
			s.setAttribute("GRADE", mvo.getGrade());
			cnt = hdao.adminlogin(ivo.getInputid());
			if(cnt == 1) {
				s.setAttribute("ADMIN", ivo.getInputid());
			}
		}
		mv.setView(rv);
		return mv;
	}
	@RequestMapping("transtest.fri")
	@Transactional
	public ModelAndView transtest(ModelAndView mv , RedirectView rv , HttpSession s) {
		rv.setUrl("/fri/");
		mv.setView(rv);
		int cnt = hdao.transtest(5);
		cnt += hdao.transtest(4);
		cnt += hdao.transtest("a");
		cnt += hdao.transtest("3");
		System.out.println(cnt);
		return mv;
	}
	@RequestMapping(value="/sendpwfindmail.fri" , produces="application/json;charset=utf8")
	@ResponseBody
	public String sendPWfindmail(String id , String mail , HttpSession s) {
		String view = "{\"result\" : \"OK\"}";
		InputVO ivo = new InputVO();
		ivo.setInputid(id);
		ivo.setInputmail(mail);
		cnt = hdao.membercheck(ivo);
		if(cnt == 0) {
			view = "{\"result\" : \"회원정보가 맞지 않습니다\"}";
		}else {
			int AN = (int) (9999 - Math.random()*5000);
			cnt = hdao.newAN(AN);
			if(cnt == 0) {
				view = "{\"result\" : \"잠시후 다시 시도해주세요\"}";
				System.out.println("error occur");
			}else {
				s.setAttribute("changer", id);
				Navermail nm = new Navermail();
				nm.send(mail, AN);
			}
		}
		return view;
	}
	@RequestMapping("/pwfindproc.fri")
	@ResponseBody
	public String pwfindproc(String AN) {
		String view = "{\"result\" : \"OK\"}";
		cnt = hdao.pwfindproc(AN);
		if(cnt == 0) {
			view = "{\"result\" : \"NO\"}";
		}
		return view;
	}
	@RequestMapping("/pwchange.fri")
	public String pwchange(HttpSession s) {
		return "hh/pwchange";
	}
	@RequestMapping("/pwchangeproc.fri")
	public ModelAndView pwchangeproc(ModelAndView mv , RedirectView rv , HttpSession s , String inputpw) {
		rv.setUrl("/fri/hh/main.fri?pwchange");
		String changer = (String) s.getAttribute("changer");
		MemberVO mvo = new MemberVO();
		mvo.setId(changer);
		mvo.setPw(inputpw);
		cnt = hdao.pwchangeproc(mvo);
		if(cnt == 0) {
			rv.setUrl("/fri/hh/pwfind.fri?fail");
		}else {
			logger.info(changer + " has change pw to " + inputpw);
		}
		mv.setView(rv);
		return mv;
	}
	@RequestMapping("/partner.fri")
	@ResponseBody
	public String partnercall(HttpSession s) {
		String view = "{\"result\" : \"OK\"}";
		String sid = (String) s.getAttribute("SID");
		cnt = hdao.getboardwritecount(sid);
		if(cnt < 15) {
			view = "{\"result\" : \"NO\"}";
		}
		return view;
	}
	@RequestMapping("/partnerproc")
	@ResponseBody
	public String partnerproc(HttpSession s) {
		String view = "{\"result\" : \"OK\"}";
		String sid = (String) s.getAttribute("SID");
		cnt = hdao.getboardwritecount(sid);
		if(cnt < 1) {
			view = "{\"result\" : \"NO\"}";
		}else {
			cnt = hdao.partnerproc(sid);
			if(cnt == 0) {
				view = "{\"result\" : \"NO\"}";
			}
		}
		return view;
	}
}