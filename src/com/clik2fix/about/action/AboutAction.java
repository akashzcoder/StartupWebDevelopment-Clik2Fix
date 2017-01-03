package com.clik2fix.about.action;

import com.clik2fix.generic.action.GenericAction;
import com.clikfix.exceptions.GlobalException;

public class AboutAction  extends GenericAction {
	public String execute() throws GlobalException {
		return "goto-about-page";
		
	}
}
