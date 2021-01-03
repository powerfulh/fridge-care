package com.fridgeCare.fri.hh;

import javax.servlet.http.HttpSession;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;


@Service
@Aspect
public class AOP {
	static Logger log1 = LoggerFactory.getLogger(AOP.class);
	@Pointcut("execution(* com.fridgeCare.fri.hh.HController.logincheck(..))")
	public void loginAspect() {
		
	}
	@After("loginAspect()")
	public void recordLog(JoinPoint join) {
		HttpSession s = (HttpSession) join.getArgs()[2];
		String sid = (String) s.getAttribute("SID");
		if(sid != null) {
			log1.info(sid + " has login");
		}
	}
	@Pointcut("execution(* com.fridgeCare.fri.hh.HController.logout(..))")
	public void logoutAspect() {
		
	}
	@Before("logoutAspect()")
	public void recordOut(JoinPoint join) {
		HttpSession s = (HttpSession) join.getArgs()[2];
		String sid = (String) s.getAttribute("SID");
		if(sid != null) {
			log1.info(sid + " has logout");
		}
	}
}
