package com.fridgeCare.fri.joo;

import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.fridgeCare.fri.joo.vo.*;

public class JooService {
	@Autowired
	JooDao jDao;
	@Autowired
	JFileUtil jfUtil;
	
	//1+2+3
	@Transactional
	public void addAll(ModelAndView mv, JooVO jVO, JTumbVO jtVO , RedirectView rv) {
		try {
			
			jVO.setInbox(editInbox(jVO.getInboxList()));
			
			jtVO = jfUtil.saveProc(jtVO.getThumb(), "/img/thumb");

			jtVO.setId(jVO.getId());
			//System.out.println("jtVO id : " + jtVO.getId());
			jDao.addThumb(jtVO);
			jVO.setTno(jtVO.getTno());
			jDao.addRecipe(jVO);
			
			MultipartFile[] file = jVO.getImage();
			//보드파트에 이미지 안넣어도 되게 수정해야함
			ArrayList<JRecipeVO> list = jfUtil.saveProc(file, "/img/upload");
			System.out.println("@@@@@@@@@@list size : "+ list.size());
			
			for (int i = 0; i < list.size(); i++) {
	
				list.get(i).setBno(jVO.getBno());
				try {
					list.get(i).setBody(jVO.getBody()[i]);
				}catch(ArrayIndexOutOfBoundsException e) {
					list.get(i).setBody("(사진 참고)");
				}
				jDao.addRecipeDetail(list.get(i));
			
			}
			System.out.println(jVO.getBno());
			rv.setUrl("/fri/juhyun/recipe/resipiPage.fri?bno=" + jVO.getBno());
			mv.setView(rv);
		} catch (Exception e) {
			mv.setViewName("joo/recipeAddError");
			
			e.printStackTrace();
		}
		
	}

	//재료 문자열 정리 전담 함수
	public String editInbox(String[] arrInbox) {
		String str = arrInbox[0];
		for(int i = 1 ; i < arrInbox.length ;i++) {
			str += ("/" + arrInbox[i]);
		}
		return str;
	}
	
	
}
