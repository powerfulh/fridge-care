package com.fridgeCare.fri.juhyun;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fridgeCare.fri.juhyun.vo.ResipiVO;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
@Controller
@RequestMapping("/juhyun/recipe")
public class ResipiController {
	
	@Autowired
	DAO rDao;
	
	// 레시피 페이지 폼 보기 요청 처리함수
	@RequestMapping(value = "/resipiPage.fri" , method=RequestMethod.GET)
	//@RequestMapping("/resipiPage.fri")
	public ModelAndView resipiPage(ModelAndView mv , PageUtil page, ResipiVO rVO, 
									HttpSession session) {
		int count = 0;
		int mno;
		int cnt = rDao.addCnt(rVO.getBno());
		if(cnt == 0) {
			System.out.println("view count proc fail");
		}
		
		if(session.getAttribute("SID") != null) {
			rVO.setId((String)session.getAttribute("SID"));
			count = rDao.getReplyCnt(rVO);
			
			mno = rDao.getMno(rVO.getId());
			
			rVO.setMno(mno);
			mv.addObject("MNO",mno);
			
			int like = rDao.getLikeCnt(rVO);
			mv.addObject("LCNT",like);
		}
		
		
		int total = rDao.getAllCnt(rVO.getBno());
		
		page.setTotalCount(total);
		page.setPage();
		
		
		rVO.setPage(page);
		
		
		String ingred = rDao.getIngred(rVO.getBno());
		String[] ingredient = ingred.split("/");
		
		ResipiVO info = rDao.getResipiInfo(rVO);
		List<ResipiVO> list = rDao.getBody(rVO.getBno());
		List<ResipiVO> reply = rDao.getReply(rVO);
		
		mv.addObject("RESIPI",info);
		mv.addObject("BODY",list);
		mv.addObject("REPLY",reply);
		mv.addObject("INGRED",ingredient);
		mv.addObject("CNT",count);
		mv.addObject("PAGE",page);
		if(rVO.getSearch() != null) {
			System.out.println(rVO.getSearch());
			String[] ingredArray = rVO.getSearch().split("/");
			for(int i = 0 ; i < ingredArray.length; i++) {
				System.out.println(ingredArray[i]);
			}
			List<ResipiVO> other = rDao.getOther(ingredArray);
			for(int i = 0 ; i < other.size(); i++) {
				System.out.println(other.get(i).getTitle());
				System.out.println(other.get(i).getDir());
			}
			mv.addObject("OTHER",other);
		}
		
		mv.setViewName("juhyun/recipe/resipiPage");
		return mv;
	}
	
	// 레시피 페이지 댓글 추가 요청 처리 함수
	@RequestMapping(value="/resipiReply.fri", params= {"bno","mno"}, method=RequestMethod.POST)
	public ModelAndView resipiReply(ModelAndView mv , RedirectView rd,
									ResipiVO rVO, HttpSession session) {
		int cnt = 0;
		
		System.out.println(rVO.getBno());
		System.out.println(rVO.getMno());
		System.out.println(rVO.getBody());
		
		cnt = rDao.addReply(rVO);
		if(cnt == 0) {
			System.out.println("reply fail");
		}
		
		mv.addObject("bno",rVO.getBno());
		rd.setUrl("/fri/juhyun/recipe/resipiPage.fri");
		
		mv.setView(rd);
		return mv;
	}
	
	// 보드 테이블 좋아요 카운트 증가 처리함수
	@RequestMapping(value="/resipiLikeCount.fri", params= {"bno","mno"}, method=RequestMethod.POST)
	public ModelAndView resipiLike(ModelAndView mv, RedirectView rd, ResipiVO rVO, HttpSession session) {
		int cnt = 0;
		int usercnt = 0;
		
		cnt = rDao.addLikeCnt(rVO.getBno());
		if(cnt == 0) {
			System.out.println("like proc fail");
		}
		usercnt = rDao.addUserLikeCnt(rVO);
		if(usercnt == 0) {
			System.out.println("insert userlike fail");
		}
		mv.addObject("bno",rVO.getBno());
		rd.setUrl("/fri/juhyun/recipe/resipiPage.fri");
		
		mv.setView(rd);
		return mv;
	}
	
	
	
}
/*
 * req.setAttribute("BODY", list); 
 * req.setAttribute("INGRED", ingred);
 * req.setAttribute("REPLY", reply); 
 * req.setAttribute("RESIPI", rVO);
 * req.setAttribute("PAGE", page); 
 * req.setAttribute("CNT", cnt);
 * req.setAttribute("OTHER", other);
 * 
 * 
 */