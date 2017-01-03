package com.clik2fix.welcome.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.clik2fix.welcome.dao.WelcomeDao;
import com.clikfix.exceptions.GlobalException;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;


public class WelcomeAction extends ActionSupport  {
	
	public Map<Integer, String> getWorkTypeMap() {
		return workTypeMap;
	}

	public void setWorkTypeMap(Map<Integer, String> workTypeMap) {
		this.workTypeMap = workTypeMap;
	}

	public Map<Integer, String> getAreaMap() {
		return areaMap;
	}

	public void setAreaMap(Map<Integer, String> areaMap) {
		this.areaMap = areaMap;
	}

	private Map<Integer, String> workTypeMap;
	private Map<Integer, String> areaMap;	

	public String execute() throws GlobalException {
		WelcomeDao wDao = new WelcomeDao();
		this.workTypeMap = wDao.getWorkTypeMap();
		this.areaMap = wDao.getAreaMap();
		return "goto-index-page";
	}
	
}
