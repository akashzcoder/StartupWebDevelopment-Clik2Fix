package com.clik2fix.faq.action;

import com.clik2fix.generic.action.GenericAction;
import com.clikfix.exceptions.GlobalException;

public class FaqAction  extends GenericAction {
	public String execute() throws GlobalException {
		return "goto-faq-page";
		
	}
}
