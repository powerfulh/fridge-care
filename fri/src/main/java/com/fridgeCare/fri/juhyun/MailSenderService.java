package com.fridgeCare.fri.juhyun;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.stereotype.Service;

@Service
public class MailSenderService {

	@Autowired
	private JavaMailSenderImpl mailSender;
	
	// 인증메일 보내기
	public void sendAuthMail(String mail, String id) {
		StringBuffer htmlContent = new StringBuffer();
		htmlContent.append("안녕하세요 " + id +" 회원님 <br>");
		htmlContent.append("현재 " + id + " 회원님은 최종 로그인 시간으로부터 1년의 시간이 경과하여 <br>");
		htmlContent.append("냉장고를 부탁해 사이트의 개인정보 보호 기간이 만료하고 있음을 알려드리며 <br>");
		htmlContent.append("1주일 안으로 로그인하지 않을시<br>");
		htmlContent.append("회원님과 관련된 모든 정보가 삭제됨을 알려드립니다.<br>");
		
		try {
			MailUtil sendMail = new MailUtil(mailSender);
			sendMail.setSubject("냉장고를 부탁해 개인 정보 삭제 예정");	// 이메일 제목
			sendMail.setText(htmlContent.toString());		// 이메일 내용
			sendMail.setFrom("tlsghkle12@naver.com", "냉부관리자");	// 서버 이메일 , 이름
			sendMail.setTo(mail);				// 클라이언트 이메일
			sendMail.send();					// 메일 보내기
		} catch(Exception e) {
			e.printStackTrace();
		}
		
	}
}
