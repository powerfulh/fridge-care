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
import com.fridgeCare.fri.hyunuk.vo.IngredVO;
import com.fridgeCare.fri.joo.vo.JNoticeVO;
import com.fridgeCare.fri.king.vo.FBAVO;
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
				logger.info(sid + " has write feedback " + cnt);
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
						logger.info(sid + " has write feedback " + cnt);
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
		s.setAttribute("HOME", "king/FBdetail.fri?target=" + target + "&");
		FBVO fbvo = masterdao.getFB(target);
		mv.addObject("FBVO", fbvo);
		cnt = masterdao.FBAcount(target);
		mv.addObject("CNT", cnt);
		if(cnt == 1) {
			FBAVO fbavo = masterdao.getFBA(target);
			mv.addObject("FBAVO", fbavo);
		}
		return mv;
	}
	@RequestMapping("/noticedetail")
	public ModelAndView noticedetail(ModelAndView mv , RedirectView rv , HttpSession s , int target) {
		s.setAttribute("HOME", "king/noticedetail.fri?target=" + target + "&");
		JNoticeVO jnvo = masterdao.getNotice(target);
		mv.addObject("JNVO", jnvo);
		return mv;
	}
	@RequestMapping("/deletenotice")
	public ModelAndView deletenotice(ModelAndView mv , RedirectView rv , HttpSession s , int target) {
		rv.setUrl("/fri/king/noticelist.fri");
		cnt = masterdao.deletenotice(target);
		if(cnt == 0) {
			System.out.println("notice delete fail");
			rv.setUrl("/fri/king/noticedetail?target=" + target);
		}else {
			logger.info("notice " + target + "has deleted by admin");
		}
		mv.setView(rv);
		return mv;
	}
	@RequestMapping("/FBanswer.fri")
	public ModelAndView FBanswer(ModelAndView mv , RedirectView rv , HttpSession s , InputVO ivo) {
		rv.setUrl("/fri/king/FBdetail.fri?target=" + ivo.getInputtarget());
		cnt = masterdao.FBanswer(ivo);
		if(cnt == 0) {
			System.out.println("FBanswer proc fail");
		}else {
			
		}
		mv.setView(rv);
		return mv;
	}
	@RequestMapping("/addingredient")
	public ModelAndView addingredient(ModelAndView mv , RedirectView rv , HttpSession s) {
		mv.setViewName("king/addingredient");
		List<IngredVO> list = masterdao.ingredientlist();
		mv.addObject("LIST", list);
		return mv;
	}
	@RequestMapping("/addingredientproc")
	public ModelAndView addingredientproc(ModelAndView mv , RedirectView rv , HttpSession s , InputVO ivo) {
		rv.setUrl("/fri/king/addingredient.fri?add");
		cnt = masterdao.addingredient(ivo);
		if(cnt == 0) {
			System.out.println("add ingredient fail");
			rv.setUrl("/fri/king/addingredient.fri?fail");
		}else {
			logger.info("ingredient " + ivo.getInputname() + " has added");
		}
		mv.setView(rv);
		return mv;
	}
}