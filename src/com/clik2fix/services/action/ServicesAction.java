package com.clik2fix.services.action;

import com.clik2fix.generic.action.GenericAction;
import com.clikfix.exceptions.GlobalException;

public class ServicesAction  extends GenericAction {
	public String execute() throws GlobalException {
		return "goto-services-page";
		
	}
}
