package com.fridgeCare.fri.joo;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import com.fridgeCare.fri.joo.vo.*;
import com.fridgeCare.fri.king.vo.FBVO;

public class JooDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	//재료리스트뽑기
	public List<String> getInList(){
		return sqlSession.selectList("jSQL.getInList");
	}
	
	//1번 보드
	public int addRecipe(JooVO jVO){
		return sqlSession.insert("addRecipe", jVO);
	}
	
	//2번 썸네일
	public int addThumb(JTumbVO jtVO) {
		return sqlSession.insert("addThumb", jtVO);
	}
	
	//3번 상세레시피
	public int addRecipeDetail(JRecipeVO jrVO) {
		return sqlSession.insert("addRecipeDetail", jrVO);
	}
	
	//썸네일가져오기
	public String getThumb(int bno) {
		return sqlSession.selectOne("jSQL.getThumb", bno);
	}
	
	//모든 피드백 리스트 ㅡ 킹
	public List<FBVO> getNotice(){
		return sqlSession.selectList("jSQL.getNotice");
	}
	
	//고객센터 자주질문 가져오기
	public List<JNoticeVO> getFaq(){
		return sqlSession.selectList("jSQL.getFaq");
	}
	
	//고객센터 큐엔에이 가져오기
	public List<JNoticeVO> getQna(){
		return sqlSession.selectList("jSQL.getQna");
	}
	
	//고객센터 본문 가져오기
	public JNoticeVO getNBody(JNoticeVO jnVO) {
		return sqlSession.selectOne("jSQL.getNBody", jnVO);
	}
	
	//고객센터 조회수 올리기
	public int upNno(JNoticeVO jnVO) {
		return sqlSession.update("jSQL.upNno", jnVO);
	}
	
	//큐엔에이 답변달기
	public int insComm(JNoticeVO jnVO) {
		return sqlSession.insert("jSQL.insComm", jnVO);
	}
}
