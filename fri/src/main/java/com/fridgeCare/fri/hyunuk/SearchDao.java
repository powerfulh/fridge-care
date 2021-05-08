package com.fridgeCare.fri.hyunuk;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fridgeCare.fri.hh.vo.InputVO;

public class SearchDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	public int logincheck(InputVO ivo) {
		return sqlSession.selectOne("hsql.logincheck", ivo);
	}
}
