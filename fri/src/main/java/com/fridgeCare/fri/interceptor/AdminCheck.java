package com.fridgeCare.fri.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class AdminCheck implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		String sid = (String) request.getSession().getAttribute("SID");
		String admin = (String) request.getSession().getAttribute("ADMIN");
		if(sid == null) {
			response.sendRedirect("/fri/hh/main.fri");
		}else {
			if(admin == null) {
				response.sendRedirect("/fri/hh/main.fri");
			}else {
				if(admin.equals(sid)) {
					return true;
				}else {
					response.sendRedirect("/fri/hh/main.fri");
				}
			}
		}
		return false;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub

	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		// TODO Auto-generated method stub

	}

}
