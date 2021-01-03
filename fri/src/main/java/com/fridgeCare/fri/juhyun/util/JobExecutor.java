package com.fridgeCare.fri.juhyun.util;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.transaction.annotation.Transactional;

import com.fridgeCare.fri.juhyun.DAO;
import com.fridgeCare.fri.juhyun.MailSenderService;
import com.fridgeCare.fri.juhyun.vo.AdminVO;
import com.fridgeCare.fri.service.AdminService;

/**
 *스케쥴 Job 실행 클래스
 */
public class JobExecutor{
	
	@Autowired
	DAO aDao;
	
	@Autowired
	MailSenderService mailSender;
	
	@Autowired
	AdminService aSrvc;
	
	@Scheduled(cron="0 39 14 * * ?")
	@Transactional
	public void jobScheduler(){
		// 메일을 보낼 사람들의 아이디 메일을 리스트에 담는다
		System.out.println("#### 스케쥴러 실행 성공 ####");
		System.out.println("member 테이블 조회중");
		List<AdminVO> list = aDao.getLoginInfo();
		
		// 최종 로그인 1년이 지난 사람수 만큼 반복
		for(int i = 0 ; i < list.size(); i++){
			// 반복횟수만큼 mailSender로 메일을 전송
			System.out.println("메일 보내는중");
			mailSender.sendAuthMail(list.get(i).getMail(), list.get(i).getId());
			System.out.println("메일 보내기 완료");
			
			// delinfo 테이블 데이터 생성
			System.out.println("delinfo 테이블 생성중");
		}
		
		// 삭제대기 7일중 로그인한 사람들 리스트 조회
		System.out.println("삭제대기 7일중 로그인한 사람들 조회중");
		List<AdminVO> logList = aDao.getSevenLogin();
		System.out.println("다시 로그인한 회원들 delinfo 데이터 삭제중");
		for(int i = 0; i < logList.size(); i++) {
			System.out.println("삭제 대기중 로그인한 회원 : " + logList.get(i).getId());
			aDao.deleteDelInfo(logList.get(i).getId());
		}
		System.out.println("삭제성공");
		
		// delete 테이블 7일 지난 데이터 조회
		System.out.println("다시 로그인하지 않은 회원 delete 테이블 조회중");
		List<AdminVO> delList = aDao.getDelInfo();
		
		// 삭제대기 7일 이상인 사람수 만큼 반복
		for(int i = 0 ; i < delList.size(); i++) {
			// id로 mno 받아오고
			System.out.println("mno 변환중");
			delList.get(i).setMno( aDao.getMno(delList.get(i).getId()) );
			
			// 'N'인 계정 전부 삭제
			System.out.println("회원 정보 삭제중");
			System.out.println("삭제할 회원 아이디 : " + delList.get(i).getId());
			int cnt = aDao.getIsshow(delList.get(i).getId());
			if(cnt == 1) {
				aSrvc.deleteMemb(delList.get(i));
			}else {
				System.out.println(delList.get(i).getId() + "회원의 isshow는 Y입니다.");
			}
			
			// delete 테이블 메일 보낸 시간이 7일이상인 데이터 이즈쇼 N으로 변경
			System.out.println("이즈쇼 변경중");
			aDao.setIsshow(delList.get(i).getId());
		}
		
		boolean bool = aSrvc.cencerAll();
		if(bool) {
			System.out.println(" 스케쥴러 종료.");
		}
		
	}

}
