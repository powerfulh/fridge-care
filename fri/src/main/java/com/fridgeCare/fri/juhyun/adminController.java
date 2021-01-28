package com.fridgeCare.fri.juhyun;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.fridgeCare.fri.juhyun.vo.AdminVO;
import com.fridgeCare.fri.service.AdminService;

@Controller
@RequestMapping("/juhyun/admin")
public class adminController {
	
	@Autowired
	DAO aDao;
	@Autowired
	AdminService aSrvc;
	
	// 관리자 계정 로그인 폼 보기 함수
	@RequestMapping("/admin.fri")
	public ModelAndView adminLogin(ModelAndView mv) {
		mv.setViewName("juhyun/admin/admin");
		return mv;
	}
	
	@RequestMapping("/addNotice.fri")
	public ModelAndView addNotice(ModelAndView mv) {
		mv.setViewName("juhyun/admin/addNotice");
		return mv;
	}
	
	@RequestMapping("/addNoticeProc.fri")
	public ModelAndView addNoticeProc(ModelAndView mv, AdminVO aVO) {
		//공지사항 추가
		if((aVO.getTitle() != null) || (aVO.getBody() != null)) {
			aDao.addNotice(aVO);
			System.out.println("공지사항 등록 완료");
		}
		
		mv.setViewName("juhyun/admin/admin");
		return mv;
	}
	@RequestMapping("/addQnAProc.fri")
	public ModelAndView addQnAProc(ModelAndView mv, AdminVO aVO) {
		System.out.println("QnA 등록 컨트롤러 실행");
		if((aVO.getTitle() != null) || (aVO.getBody() != null)) {
			aDao.addQnA(aVO);
			System.out.println("등록 완료");
		}
		
		mv.setViewName("juhyun/admin/admin");
		return mv;
	}
	@RequestMapping("/addFAQProc.fri")
	public ModelAndView addFAQProc(ModelAndView mv, AdminVO aVO) {
		System.out.println("FAQ 등록 컨트롤러 실행");
		if((aVO.getTitle() != null) || (aVO.getBody() != null)) {
			aDao.addFAQ(aVO);
			System.out.println("등록 완료");
		}
		
		mv.setViewName("juhyun/admin/admin");
		return mv;
	}
	
	
	@RequestMapping("/wordCencerPage.fri")
	public ModelAndView wordCencerPage(ModelAndView mv) {
		mv.setViewName("juhyun/admin/wordCencerPage");
		return mv;
	}
	@RequestMapping("/addCencerProc.fri")
	public ModelAndView addCencerProc(ModelAndView mv,AdminVO aVO) {
		System.out.println("인터셉터 작동 완료");
		mv.setViewName("juhyun/admin/wordCencerPage");
		return mv;
	}
	
	
	@RequestMapping("/deletePage.fri")
	public ModelAndView deletePage(ModelAndView mv) {
		mv.setViewName("juhyun/admin/deletePage");
		return mv;
	}
	
	@RequestMapping("/deletePageProc.fri")
	public ModelAndView deletePageProc(ModelAndView mv, HttpSession session, AdminVO aVO) {
		
		System.out.println("id : " + aVO.getId());
		AdminVO info = aDao.getMemb(aVO.getId());
		mv.addObject("INFO",info);
		
		mv.setViewName("juhyun/admin/deletePage");
		return mv;
	}
	
	@RequestMapping("/delete.fri")
	public ModelAndView delete(ModelAndView mv,AdminVO aVO) {
		try {
			aVO.setMno(aDao.getMno(aVO.getId()));
			
			System.out.println("mno : " + aVO.getMno());
			
			aSrvc.deleteMemb(mv, aVO, aDao);
		}catch(Exception e) {}
		mv.setViewName("juhyun/admin/deletePage");
		return mv;
	}
}
