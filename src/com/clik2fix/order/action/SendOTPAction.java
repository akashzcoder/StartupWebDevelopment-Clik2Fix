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

public class SendOTPAction extends GenericAction {
	
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

	private Map<Integer, String> areaMap;	
	
	public Map<Integer, String> getAreaMap() {
		return areaMap;
	}

	public void setAreaMap(Map<Integer, String> areaMap) {
		this.areaMap = areaMap;
	}
	
	public String getCustName() {
		return custName;
	}

	public void setCustName(String custName) {
		this.custName = custName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getWorkSummary() {
		return workSummary;
	}

	public void setWorkSummary(String workSummary) {
		this.workSummary = workSummary;
	}

	private int workTypeId;
	private int areaId;
	private String custName;
	private String email;
	private String mobile;
	private String address;
	private String workSummary;
	private String otp;

	public String getOtp() {
		return otp;
	}

	public void setOtp(String otp) {
		this.otp = otp;
	}

	public String execute() throws GlobalException {
		this.getHttpSession().setAttribute("workTypeId", this.workTypeId);
		this.getHttpSession().setAttribute("areaId", this.areaId);
		this.getHttpSession().setAttribute("custName", this.custName);
		this.getHttpSession().setAttribute("email", this.email);
		this.getHttpSession().setAttribute("mobile", this.mobile);
		this.getHttpSession().setAttribute("address", this.address);
		this.getHttpSession().setAttribute("workSummary", this.workSummary);
		
		String otp = new Integer(OTPGenerator.generateOTP()).toString();
		
		String otpMsg = SMSTemplate.OTP + otp;
		SMS.sendSMS(otpMsg, this.mobile);
		
		this.getHttpSession().setAttribute("otp", otp);
		
		this.setOtp(otp);
		
		return "GLOBAL_JSON_RESULT";
	}
	
	
}
