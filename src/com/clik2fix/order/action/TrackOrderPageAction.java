package com.clik2fix.order.action;

import com.clik2fix.generic.action.GenericAction;
import com.clikfix.exceptions.GlobalException;

public class TrackOrderPageAction  extends GenericAction {
	public String execute() throws GlobalException {
		return "goto-track-order-page";
		
	}
}
