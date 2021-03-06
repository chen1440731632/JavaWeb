package com.wlql.interceptors;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.wlql.domain.Manage;
import com.wlql.domain.WebUser;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String[] IGNORE_URI = {"identifyCode","login",".js",".css",".img",".png","WebUserRegister"};

	@Override
	public void postHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		// TODO Auto-generated method stub
		super.postHandle(request, response, handler, modelAndView);
	}

	@Override
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler) throws Exception {
			boolean flag = false;
	        String url = request.getRequestURL().toString();
	        System.out.println(">>>: " + url);
	        for (String s : IGNORE_URI) {
	            if (url.contains(s)) {
	                flag = true;
	                break;
	            }
	        }
	        if (!flag) {
	            Manage manage = (Manage) request.getSession().getAttribute("manage");
	            WebUser webUser = (WebUser) request.getSession().getAttribute("webUser");
	            if (manage != null) flag = true;
	            if (webUser != null) flag = true;
	           
	            
	        }
	        return flag;
		}

	
	
}
