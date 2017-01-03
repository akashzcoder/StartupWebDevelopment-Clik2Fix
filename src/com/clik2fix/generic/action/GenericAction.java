package com.clik2fix.generic.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.clikfix.exceptions.GlobalException;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class GenericAction extends ActionSupport  {
		
	public static HttpServletRequest getHttpServletRequest() throws GlobalException {
		final ActionContext context = ActionContext.getContext();
	    HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);
	    return request;
	}
	
	public static HttpSession getHttpSession() throws GlobalException {
		final ActionContext context = ActionContext.getContext();
	    HttpServletRequest request = (HttpServletRequest) context.get(ServletActionContext.HTTP_REQUEST);
	    HttpSession session = request.getSession(true);
	    return session;
	}	
}
