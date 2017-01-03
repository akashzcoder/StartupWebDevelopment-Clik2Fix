package com.clik2fix.contact.action;

import com.clik2fix.generic.action.GenericAction;
import com.clikfix.exceptions.GlobalException;

public class ContactPageAction  extends GenericAction {
	public String execute() throws GlobalException {
		return "goto-contact-page";
		
	}
}
