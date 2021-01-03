package com.fridgeCare.fri.hh.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class Navermail {
	String hanhoon12 , naverpw;
	HSD hsd;
	Properties prop;
	Session session;
	MimeMessage message;
	public Navermail() {
		hanhoon12 = "hanhoon12@naver.com";
		hsd = new HSD();
		naverpw = hanhoon12.substring(7,9) + "q" + hsd.data1 + Integer.toString(5+7);
		prop = new Properties();
		prop.put("mail.smtp.host", "smtp.naver.com");
		prop.put("mail.smtp.port", 587);
		prop.put("mail.smtp.auth", "true");
		session = Session.getDefaultInstance(prop, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(hanhoon12, naverpw);
			}
		});
		message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(hanhoon12));
			message.setSubject("fri 에서 당신의 인증이 필요하다");
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
	public void send(String targetmail , int AN) {
		try {
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(targetmail));
			message.setText("다음 번호를 입력하여 새로운 비밀번호를 생성하세요 = " + AN);
			Transport.send(message);
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
	}
}

class HSD{
	String data1 = "f";
	public HSD() {
		if(data1.equals("z")) {
			System.out.println("unknown print");
		}else {
			data1 = "w";
		}
	}
}