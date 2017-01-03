package com.clik2fix.order.action;

import java.util.Map;

import com.clik2fix.generic.action.GenericAction;
import com.clik2fix.welcome.dao.WelcomeDao;
import com.clikfix.exceptions.GlobalException;

public class PlaceOrderAction extends GenericAction {
	
	public int getWorkTypeId() {
		return workTypeId;
	}

	public void setWorkTypeId(int workTypeId) {
		this.workTypeId = workTypeId;
	}

	public int getAreaId() {
		return areaId;
	}

	public void setAreaId(int areaId) {
		this.areaId = areaId;
	}

	private int workTypeId;
	private int areaId;
	private Map<Integer, String> areaMap;	
	
	public Map<Integer, String> getAreaMap() {
		return areaMap;
	}

	public void setAreaMap(Map<Integer, String> areaMap) {
		this.areaMap = areaMap;
	}

	public String execute() throws GlobalException {
		WelcomeDao wDao = new WelcomeDao();
		this.areaMap = wDao.getAreaMap();
		return "goto-place-order-page";
	}
	
	
}
