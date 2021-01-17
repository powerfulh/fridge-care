package com.fridgeCare.fri.king;

import java.sql.SQLException;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fridgeCare.fri.hh.vo.InputVO;
import com.fridgeCare.fri.joo.vo.JNoticeVO;
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
}
