package com.fridgeCare.fri.hyunuk;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fridgeCare.fri.hyunuk.vo.GetVO;
import com.fridgeCare.fri.hyunuk.vo.IngredVO;
import com.fridgeCare.fri.hyunuk.vo.SearchVO;

public class SearchDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 게시물 조회
	public List<SearchVO> getRecipelist(Map<String, String> map){
		return sqlSession.selectList("sSQL.getRecipelist", map);
	}

	// 재료 채워주는 함수
	public int getData(GetVO gVO) {
		return sqlSession.selectOne("sSQL.getIngredient");
	}
	
	// 재료 전부 조회 
	public List<IngredVO> getIngredient(IngredVO inVO) {
		return sqlSession.selectList("sSQL.getIngredient", inVO);
	}
	
	// 타이틀 검색
	public List<SearchVO> titleSearch(Map<String, Object> map) {
		return sqlSession.selectList("sSQL.TitleSearch", map);
	}
	
	// 조회수 증가
	public int increseCnt(int bno) {
		return sqlSession.update("sSQL.increseCnt");
	}
	
	public int searchCNT(String search) {
		return sqlSession.selectOne("sSQL.searchCNT");
	}
	
}
