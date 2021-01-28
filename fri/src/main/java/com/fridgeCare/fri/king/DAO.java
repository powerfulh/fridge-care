package com.fridgeCare.fri.king;

import java.sql.SQLException;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fridgeCare.fri.hh.vo.InputVO;
import com.fridgeCare.fri.hyunuk.vo.IngredVO;
import com.fridgeCare.fri.joo.vo.JNoticeVO;
import com.fridgeCare.fri.king.vo.FBAVO;
import com.fridgeCare.fri.king.vo.FBVO;

public class DAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	int cnt;
	public String getOwnerID(int bno) {
		return sqlSession.selectOne("ownercheck", bno);
	}
	public int updateBisshow(int bno) {
		return sqlSession.update("updateBisshow", bno);
	}
	public int writeFBproc(InputVO ivo) throws SQLException {
		cnt = sqlSession.insert("insertFB", ivo);
		return cnt;
	}
	public int FBdefaultdata() {
		cnt = sqlSession.insert("insertFBdefault");
		return cnt;
	}
	public int maxFBn() {
		return sqlSession.selectOne("FBmaxn");
	}
	public FBVO getFB(int target) {
		return sqlSession.selectOne("selectFB", target);
	}
	public JNoticeVO getNotice(int target) {
		return sqlSession.selectOne("selectnotice", target);
	}
	public List<JNoticeVO> noticelist(){
		return sqlSession.selectList("noticelist");
	}
	public int deletenotice(int target) {
		return sqlSession.update("UInotice", target);
	}
	public int FBanswer(InputVO ivo) {
		return sqlSession.insert("insertFBA", ivo);
	}
	public int FBAcount(int target) {
		return sqlSession.selectOne("getFBAcount", target);
	}
	public FBAVO getFBA(int target) {
		return sqlSession.selectOne("getFBA", target);
	}
	public List<IngredVO> ingredientlist(){
		return sqlSession.selectList("ksql.getingredient");
	}
	public int addingredient(InputVO ivo) {
		return sqlSession.insert("insertingredient", ivo);
	}
}
