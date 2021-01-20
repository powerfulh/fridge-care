package com.fridgeCare.fri.king;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fridgeCare.fri.hh.vo.InputVO;
import com.fridgeCare.fri.joo.vo.JNoticeVO;
import com.fridgeCare.fri.king.vo.FBVO;
@Controller
@RequestMapping("/king")
public class KingController {
	int cnt;
	static Logger logger = LoggerFactory.getLogger(KingController.class);
	@Autowired
	DAO masterdao;
	@RequestMapping("/writeFB")
	public String writeFB() {
		
		return "king/writeFB";
	}
	@RequestMapping("/noticelist")
	public ModelAndView Noticelist(ModelAndView mv , RedirectView rv , HttpSession s) {
		s.setAttribute("HOME", "king/noticelist.fri?");
		List<JNoticeVO> list = masterdao.noticelist();
		mv.addObject("LIST", list);
		mv.setViewName("king/noticelist");
		return mv;
	}
	@RequestMapping("/writeFBproc")
	public ModelAndView writeFBproc(ModelAndView mv , RedirectView rv , HttpSession s , InputVO ivo) {
		String sid = (String) s.getAttribute("SID");
		ivo.setInputid(sid);
		try {
			cnt = masterdao.writeFBproc(ivo);
			if(cnt == 0) {
				System.out.println("FB insert fail");
			}else {
				cnt = masterdao.maxFBn();
				rv.setUrl("/fri/king/FBdetail.fri?target=" + cnt);
			}
		} catch (Exception e) {
			cnt = masterdao.FBdefaultdata();
			if(cnt == 0) {
				System.out.println("FB defaultdata insert fail");
			}else {
				try {
					cnt = masterdao.writeFBproc(ivo);
					if(cnt == 0) {
						System.out.println("FB insert fail");
					}else {
						cnt = masterdao.maxFBn();
						rv.setUrl("/fri/king/FBdetail.fri?target=" + cnt);
					}
				}catch(Exception e2) {
					e2.printStackTrace();
				}
			}
		}
		mv.setView(rv);
		return mv;
	}
	@RequestMapping("/FBdetail")
	public ModelAndView FBdetail(ModelAndView mv , RedirectView rv , HttpSession s , int target) {
		FBVO fbvo = masterdao.getFB(target);
		mv.addObject("FBVO", fbvo);
		return mv;
	}
	@RequestMapping("/noticedetail")
	public ModelAndView noticedetail(ModelAndView mv , RedirectView rv , HttpSession s , int target) {
		JNoticeVO jnvo = masterdao.getNotice(target);
		mv.addObject("JNVO", jnvo);
		return mv;
	}
}