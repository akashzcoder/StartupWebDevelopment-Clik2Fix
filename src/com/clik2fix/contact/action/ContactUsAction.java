package com.clik2fix.contact.action;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Map;

import org.json.JSONException;
import org.json.JSONObject;

import com.clik2fix.generic.action.GenericAction;
import com.clik2fix.sms.SMS;
import com.clik2fix.sms.SMSTemplate;
import com.clik2fix.util.EMailUtil;
import com.clik2fix.util.EmailTemplate;
import com.clik2fix.welcome.dao.WelcomeDao;
import com.clikfix.db.BaseDAO;
import com.clikfix.exceptions.GlobalException;

public class ContactUsAction extends GenericAction {
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
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public boolean getFeedbackResult() {
		return feedbackResult;
	}

	public void setFeedbackResult(boolean feedbackResult) {
		this.feedbackResult = feedbackResult;
	}

	private String custName;
	private String email;
	private String msg;
	private boolean feedbackResult;
	
	
	
	public String execute() throws GlobalException {
		this.feedbackResult = false;
		
		Connection con = null;
		Statement stmt = null;
				
		int effRows = 0;
		try {
			con = BaseDAO.getDBConnection();
			stmt = con.createStatement();
			
			String sql = "insert into tbl_enq (cust_name, email, msg) values('"+custName+"','"+email+"','"+msg+"')";
			effRows = stmt.executeUpdate(sql);
			
		} catch (Exception e) {			
			//e.printStackTrace();
			this.feedbackResult = false;
		} finally {
			try {
				BaseDAO.close(stmt);
				BaseDAO.close(con);
			} catch (GlobalException e) {
				//e.printStackTrace();
			}
			
		}
		
		if(effRows > 0) {
			this.feedbackResult = true;
			String emailBody = EmailTemplate.NEW_ENQUIRY.replace("VAR_1", email);
			emailBody = emailBody.replace("VAR_2", msg);
			try {
				EMailUtil.sendMail("support@clik2fix.com", "New Enquiry", emailBody);
			} catch (GlobalException e) {
				//e.printStackTrace();
			}
		}
		
		return "GLOBAL_JSON_RESULT";
	}
	
	
}
