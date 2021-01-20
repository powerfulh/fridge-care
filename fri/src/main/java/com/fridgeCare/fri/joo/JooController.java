package com.fridgeCare.fri.joo;

import java.util.*;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fridgeCare.fri.hh.util.Hoonpage;
import com.fridgeCare.fri.joo.vo.*;
import com.fridgeCare.fri.king.vo.FBVO;
import com.fridgeCare.fri.king.vo.PageVO;

@Controller
public class JooController {
	@Autowired
	JooDao jDao;
	@Autowired
	JooService jSrvc;
	PageVO pvo;
	@RequestMapping("/joo/recipeAdd.fri")
	public ModelAndView addRecipe(ModelAndView mv) {
		List<String> list = jDao.getInList();
		mv.addObject("LIST", list);
		mv.setViewName("joo/recipeAdd");
		return mv;
	}
	
	@RequestMapping("/joo/recipeIngred.fri")
	public ModelAndView addIngredProc(ModelAndView mv, JooVO jVO) {
		String str = jSrvc.editInbox(jVO.getInboxList());
		jVO.setInbox(str);
		return mv;
	}
	
	@RequestMapping("/joo/recipeAddProc.fri")
	public ModelAndView addRecipeProc(ModelAndView mv, JooVO jVO, JTumbVO jtVO , RedirectView rv) {
		jSrvc.addAll(mv, jVO, jtVO , rv);
		return mv;
	}
	
	@RequestMapping("/joo/notice.fri") // 고객센터요청
	public ModelAndView viewNotice(ModelAndView mv, JNoticeVO jnVO , HttpSession s , int page) {
		s.setAttribute("HOME", "joo/notice.fri?page=" + page + "&");
		JNoticeVO jnvo = jDao.getLatelyNotice();
		mv.addObject("JNVO", jnvo);
		int totalcount = jDao.feedbackcount();
		int countforpage = 10;
		int pageblockcount = 3;
		Hoonpage pageutil = new Hoonpage(totalcount, countforpage, pageblockcount, page);
		pvo = new PageVO();
		pvo.setFirstcontent(pageutil.Pageset());
		pvo.setLastcontent(countforpage);
		List<FBVO> list = jDao.getNotice(pvo);
		mv.addObject("LIST", list);
		ArrayList<Integer> pagelist = pageutil.getoddfixblock();
		mv.addObject("pageutil", pageutil);
		mv.addObject("pagelist", pagelist);
		mv.setViewName("king/feedback");
		return mv;
	}
	
	@RequestMapping(value="/joo/noticeBody.fri", produces="application/json; charset=utf8")
	@ResponseBody
	public JNoticeVO addNBody(JNoticeVO jnVO) {
		jDao.upNno(jnVO);
		jnVO = jDao.getNBody(jnVO);
		System.out.println(jnVO.getNbody() + " | " + jnVO.getNclick());
		return jnVO;
	}
	
	@RequestMapping("/joo/noticeAnswerProc.fri")
	public ModelAndView insComm(ModelAndView mv, JNoticeVO jnVO) {
		int cnt = jDao.insComm(jnVO);
		System.out.println("cnt : " + cnt);
		mv.setViewName("redirect:/joo/notice.fri");
		return mv;
	}
}
