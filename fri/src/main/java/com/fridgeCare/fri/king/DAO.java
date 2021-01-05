package com.fridgeCare.fri.king;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

public class DAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	public String getOwnerID(int bno) {
		return sqlSession.selectOne("ownercheck", bno);
	}
	public int updateBisshow(int bno) {
		return sqlSession.update("updateBisshow", bno);
	}
}
