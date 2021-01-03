package com.fridgeCare.fri.juhyun;

import java.util.*;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fridgeCare.fri.juhyun.vo.*;

public class DAO {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	// 레시피 정보 가져오기 전담 처리 함수
	public ResipiVO getResipiInfo(ResipiVO rVO) {
		return sqlSession.selectOne("rSQL.getResipiInfo", rVO);
	}
	// 아이디로 회원번호 가져오기 처리 함수
	public int getMno(String id) {
		return sqlSession.selectOne("rSQL.getMno",id);
	}
	// 재료 설명 가져오기 전담 처리함수
	public List<ResipiVO> getBody(int bno){
		return sqlSession.selectList("rSQL.getBody", bno);
	}
	// 댓글 가져오기 전담 처리 함수
	public List<ResipiVO> getReply(ResipiVO rVO){
		return sqlSession.selectList("rSQL.getReply", rVO);
	}
	// 게시글 수 조회 전담 처리함수
	public int getAllCnt(int bno) {
		return sqlSession.selectOne("rSQL.getAllCnt", bno);
	}
	// 유저 댓글 확인 전담 처리 함수
	public int getReplyCnt(ResipiVO rVO) {
		return sqlSession.selectOne("rSQL.getReplyCnt", rVO);
	}
	// 선택 재료로 가능한 레시피 불러오기 전담 처리 함수
	public List<ResipiVO> getOther(String[] ingredArray){
		return sqlSession.selectList("rSQL.getOther", ingredArray);
	}
	// 보드 테이블 좋아요 카운트 증가 처리 함수
	public int addLikeCnt(int bno) {
		return sqlSession.update("rSQL.addLikeCnt", bno);
	}
	// 유저라이크 테이블 데이터 추가 처리 함수
	public int addUserLikeCnt(ResipiVO rVO) {
		return sqlSession.insert("rSQL.addUserLikeCnt", rVO);
	}
	// 댓글 저장 전담 처리 함수
	public int addReply(ResipiVO rVO) {
		return sqlSession.insert("rSQL.addReply", rVO);
	}
	
	public String getIngred(int bno) {
		return sqlSession.selectOne("rSQL.getIngred", bno);
	}
	public int getLikeCnt(ResipiVO rVO) {
		return sqlSession.selectOne("rSQL.getLikeCnt", rVO);
	}
	// 조회수 증가 전담 처리 함수
	public int addCnt(int bno) {
		return sqlSession.update("rSQL.addCnt", bno);
	}
	
	
	// 파트너 보드 리스트 전담 처리 함수
	public List<PartnerVO> getBoardInfo(PageUtil page){
		return sqlSession.selectList("pSQL.getBoardInfo", page);
	}
	
	// 보드 리스트 갯수 전담 처리 함수
	public int getBoardCnt() {
		return sqlSession.selectOne("pSQL.getBoardCnt");
	}
	
	
	// 관리자 계정 
	
	// 삭제할 회원 정보 조회 처리 함수
	public AdminVO getMemb(String id) {
		return sqlSession.selectOne("aSQL.getMemb", id);
	}
	
	// 회원 정보 삭제 처리 함수들
	public int deleteThumb(int mno) {
		return sqlSession.delete("aSQL.deleteThumb", mno);
	}
	public int deleteReply(int mno) {
		return sqlSession.delete("aSQL.deleteReply", mno);
	}
	public List<AdminVO> getBnoList(int mno){
		return sqlSession.selectList("aSQL.getBnoList", mno);
	}
	public int deleteBoardPart(int bno) {
		return sqlSession.delete("aSQL.deleteBoardPart", bno);
	}
	public int deleteUserLike(int mno) {
		return sqlSession.delete("aSQL.deleteUserLike", mno);
	}
	public int deleteLikeBno(int bno) {
		return sqlSession.delete("aSQL.deleteLikeBno", bno);
	}
	public int deleteBoard(int mno) {
		return sqlSession.delete("aSQL.deleteBoard", mno);
	}
	public int deleteBoardBno(int bno) {
		return sqlSession.delete("aSQL.deleteBoardBno", bno);
	}
	public List<AdminVO> getBoardThumb(int mno) {
		return sqlSession.selectList("aSQL.getBoardThumb", mno);
	}
	public int getBnoThumb(int bno) {
		return sqlSession.selectOne("aSQL.getBnoThumb", bno);
	}
	public int deleteBoardThumb(int tno) {
		return sqlSession.delete("aSQL.deleteBoardThumb", tno);
	}
	public int deleteBoardReply(int bno) {
		return sqlSession.delete("aSQL.deleteBoardReply", bno);
	}
	public int deleteMemb(int mno) {
		return sqlSession.delete("aSQL.deleteMemb", mno);
	}
	
	
	public List<AdminVO> getLoginInfo() {
		return sqlSession.selectList("aSQL.getLoginInfo");
	}
	public int addDelInfo(AdminVO aVO) {
		return sqlSession.insert("aSQL.addDelInfo", aVO);
	}
	public List<AdminVO> getSevenLogin() {
		return sqlSession.selectList("aSQL.getSevenLogin");
	}
	public int getIsshow(String id) {
		return sqlSession.selectOne("aSQL.getIsshow", id);
	}
	public int deleteDelInfo(String id) {
		return sqlSession.delete("aSQL.deleteDelInfo", id);
	}
	public int setIsshow(String id) {
		return sqlSession.update("aSQL.setIsshow", id);
	}
	public List<AdminVO> getDelInfo() {
		return sqlSession.selectList("aSQL.getDelInfo");
	}
	
	
	public int getBoardMno(int bno) {
		return sqlSession.selectOne("aSQL.getBoardMno", bno);
	}
	public List<Integer> getCencerBoard(String body) {
		return sqlSession.selectList("aSQL.getCencerBoard", body);
	}
	public List<Integer> getCencerBoardPart(String body) {
		return sqlSession.selectList("aSQL.getCencerBoardPart", body);
	}
	public int getCencerAll() {
		return sqlSession.selectOne("aSQL.getCencer");
	}
	public int getCencerCnt(String body) {
		return sqlSession.selectOne("aSQL.getCencerCnt", body);
	}
	public List<AdminVO> getCencerList() {
		return sqlSession.selectList("aSQL.getCencerList");
	}
	public int addCencer(String body) {
		return sqlSession.insert("aSQL.addCencer", body);
	}
	public List<AdminVO> getCencerBoard() {
		return sqlSession.selectList("aSQL.getCencerBoard");
	}
	public List<AdminVO> getCencerBoardPart() {
		return sqlSession.selectList("aSQL.getCencerBoardPart");
	}
	public List<Integer> getCencerReply(String body) {
		return sqlSession.selectList("aSQL.getCencerReply", body);
	}
	public List<AdminVO> getCencerMember(String body) {
		return sqlSession.selectList("aSQL.getCencerMember", body);
	}
	public int deleteCencerBoardPart(int bpno) {
		return sqlSession.delete("aSQL.deleteCencerBoardPart", bpno);
	}
	public int deleteCencerReply(int reno) {
		return sqlSession.delete("aSQL.deleteCencerReply", reno);
	}
	
	
	public int addNotice(AdminVO aVO) {
		return sqlSession.insert("aSQL.addNotice", aVO);
	}
	public int addFAQ(AdminVO aVO) {
		return sqlSession.insert("aSQL.addFAQ", aVO);
	}
	public int addQnA(AdminVO aVO) {
		return sqlSession.insert("aSQL.addQnA", aVO);
	}
}
