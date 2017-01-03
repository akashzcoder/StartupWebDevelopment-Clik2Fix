package com.clik2fix.order.action;

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

public class TrackOrderAction extends GenericAction {
	
	private String orderStatus;
	private String orderNumber;
	private String orderStatusType;
	
	public String getOrderStatusType() {
		return orderStatusType;
	}

	public void setOrderStatusType(String orderStatusType) {
		this.orderStatusType = orderStatusType;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String execute() throws GlobalException {
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String status = null;
		try {
			con = BaseDAO.getDBConnection();
			stmt = con.createStatement();

			String sql = "SELECT t1.order_status_name FROM tbl_order_status t1, tbl_orders t2 where t2.status = t1.order_status_id and t2.order_number = '" + this.orderNumber+"'";
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				status = rs.getString("order_status_name");
				this.orderStatusType = "success";
			}
			
		} catch (Exception e) {			
			status = "Invalid order number. Please enter the correct order number sent to your mobile.";
			this.orderStatusType = "failed";
		} finally {
			try {
				BaseDAO.close(rs);
				BaseDAO.close(stmt);
				BaseDAO.close(con);
			} catch (GlobalException e) {
				e.printStackTrace();
			}
			
		}
		
		if(status == null) {
			status = "Invalid order number. Please enter the correct order number sent to your mobile.";
			this.orderStatusType = "failed";
		}
		
		this.setOrderStatus(status);
		
		return "GLOBAL_JSON_RESULT";
	}
	
	
}
