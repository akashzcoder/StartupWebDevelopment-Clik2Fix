package com.clik2fix.order.action;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;

import org.json.JSONException;
import org.json.JSONObject;

import com.clik2fix.generic.action.GenericAction;
import com.clik2fix.otp.OTPGenerator;
import com.clik2fix.sms.SMS;
import com.clik2fix.sms.SMSTemplate;
import com.clik2fix.util.EMailUtil;
import com.clik2fix.util.EmailTemplate;
import com.clik2fix.welcome.dao.WelcomeDao;
import com.clikfix.db.BaseDAO;
import com.clikfix.exceptions.GlobalException;

public class VerifyOTPAction extends GenericAction {
	
	private boolean verifyOtpStatus;

	public boolean isVerifyOtpStatus() {
		return verifyOtpStatus;
	}

	public void setVerifyOtpStatus(boolean verifyOtpStatus) {
		this.verifyOtpStatus = verifyOtpStatus;
	}
	
	private int otp;	

	public int getOtp() {
		return otp;
	}

	public void setOtp(int otp) {
		this.otp = otp;
	}

	public String execute() throws GlobalException {
		System.out.println("Verify...");
		if(Integer.parseInt(this.getHttpSession().getAttribute("otp").toString()) == otp){
			this.verifyOtpStatus = true;			
		} else {
			this.verifyOtpStatus = false;			
		}
		
		return "GLOBAL_JSON_RESULT";
	}
	
	
}
