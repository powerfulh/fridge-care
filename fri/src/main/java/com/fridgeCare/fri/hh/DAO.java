package com.fridgeCare.fri.hh;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fridgeCare.fri.hh.vo.InputVO;
import com.fridgeCare.fri.hh.vo.LatelyUploadVO;
import com.fridgeCare.fri.hh.vo.MemberVO;
import com.fridgeCare.fri.hh.vo.SideRankVO;
import com.fridgeCare.fri.hh.vo.ThumbVO;

public class DAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	public int idcheck(String id) {
		return sqlSession.selectOne("hsql.idcheck", id);
	}
	public int mailcheck(String mail) {
		return sqlSession.selectOne("hsql.mailcheck", mail);
	}
	public int joinproc(InputVO ivo) {
		return sqlSession.insert("hsql.insertmember", ivo);
	}
	public int infoedit(InputVO ivo) {
		return sqlSession.update("hsql.updatemember", ivo);
	}
	public int logincheck(InputVO ivo) {
		return sqlSession.selectOne("hsql.logincheck", ivo);
	}
	public String getThumb(String sid) {
		return sqlSession.selectOne("hsql.getThumb", sid);
	}
	public int setAvt(ThumbVO tvo) {
		return sqlSession.insert("hsql.insertavt", tvo);
	}
	public int editAvt(ThumbVO tvo) {
		return sqlSession.update("hsql.updateavt", tvo);
	}
	public LatelyUploadVO getLUVO() {
		return sqlSession.selectOne("hsql.getLUVO");
	}
	public SideRankVO getWR() {
		return sqlSession.selectOne("hsql.getweekrank");
	}
	public SideRankVO getMR() {
		return sqlSession.selectOne("hsql.getmonthrank");
	}
	public MemberVO getmvo(String sid) {
		return sqlSession.selectOne("hsql.getmemberinfo", sid);
	}
	public int submitCondate(String sid) {
		return sqlSession.update("hsql.submitcondate", sid);
	}
	public int transtest(Object transdata) {
		return sqlSession.insert("transtest" , transdata);
	}
	public int membercheck(InputVO ivo) {
		return sqlSession.selectOne("membercheck" , ivo);
	}
	public int newAN(int AN) {
		return sqlSession.update("updateAN", AN);
	}
	public int pwfindproc(String AN) {
		return sqlSession.selectOne("pwfindproc", AN);
	}
	public int pwchangeproc(MemberVO mvo) {
		return sqlSession.update("updatepw", mvo);
	}
	public int secession(String sid) {
		return sqlSession.update("secession", sid);
	}
	public int getboardwritecount(String sid) {
		return sqlSession.selectOne("confirmpartner", sid);
	}
	public int partnerproc(String sid) {
		return sqlSession.update("updategrade", sid);
	}
}
