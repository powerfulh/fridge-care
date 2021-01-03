package com.fridgeCare.fri.joo;

import java.util.*;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fridgeCare.fri.joo.vo.*;

@Controller
public class JooController {
	@Autowired
	JooDao jDao;
	@Autowired
	JooService jSrvc;
	
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
	
	@RequestMapping("/joo/notice.fri")
	public ModelAndView veiwNotice(ModelAndView mv, JNoticeVO jnVO) {
		List<JNoticeVO> list = jDao.getNotice();
		mv.addObject("LIST", list);

		List<JNoticeVO> flist = jDao.getFaq();
		mv.addObject("FLIST", flist);
		
		List<JNoticeVO> qlist = jDao.getQna();
		mv.addObject("QLIST", qlist);
		
		mv.setViewName("joo/jooNotice");
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
