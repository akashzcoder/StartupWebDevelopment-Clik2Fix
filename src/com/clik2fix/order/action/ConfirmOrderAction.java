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

public class ConfirmOrderAction extends GenericAction {

	private String orderId;	

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String execute() throws GlobalException {
		int workTypeId = Integer.parseInt(this.getHttpSession().getAttribute("workTypeId").toString());
		int areaId = Integer.parseInt(this.getHttpSession().getAttribute("areaId").toString());
		String custName = this.getHttpSession().getAttribute("custName").toString();
		String email = this.getHttpSession().getAttribute("email").toString();
		String mobile = this.getHttpSession().getAttribute("mobile").toString();
		String address = this.getHttpSession().getAttribute("address").toString();
		String workSummary = this.getHttpSession().getAttribute("workSummary").toString();
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String workTypeName = null;
		String areaName = null;
		
		int effRows = 0;
		int maxOrderId = 0;
		String prefix = null;
		
		try {
			con = BaseDAO.getDBConnection();
			stmt = con.createStatement();
			
			int orderStatus = 1;
			
			String sql = "insert into tbl_orders (name,email,mobile,address,status,work_type,area,work_summary) values('"+custName+"','"+email+"','"+mobile+"','"+address+"','"+orderStatus+"','"+workTypeId+"','"+areaId+"','"+workSummary+"')";
			effRows = stmt.executeUpdate(sql);
			BaseDAO.close(stmt);
			
			sql = "select work_type_name, prefix from tbl_work_type where work_type_id = " + workTypeId;
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				workTypeName = rs.getString("work_type_name");
				prefix = rs.getString("prefix");
			}
			BaseDAO.close(rs, stmt);
			
			sql = "select area_name from tbl_area where area_id = " + areaId;
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			if(rs.next()) {
				areaName = rs.getString("area_name");
			}
			BaseDAO.close(rs, stmt);
			
			if(effRows > 0) {
				sql = "select max(order_id) max_order_id from tbl_orders";
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				if(rs.next()) {
					maxOrderId = rs.getInt("max_order_id");
				}
				
				sql = "update tbl_orders set order_number = '" + prefix + new Integer(maxOrderId).toString() + "' where order_id = " + maxOrderId;
				stmt = con.createStatement();
				stmt.executeUpdate(sql);
				BaseDAO.close(stmt);

				//send sms
				String smsMsg = SMSTemplate.NEW_ORDER.replace("VAR_1,", " "+custName + ", ");
				smsMsg = smsMsg.replace("VAR_2", ": " + prefix + new Integer(maxOrderId).toString());
				smsMsg = smsMsg.replace("Our", " Our");
				//System.out.println(smsMsg);
				boolean smsStatus = SMS.sendSMS(smsMsg, mobile);
				if(smsStatus == true) {
					System.out.println("SMS: sent successfully");
				} else {
					System.out.println("SMS: Failed");
				}
				
				smsMsg = SMSTemplate.NEW_ORDER_TO_ADMIN.replace("VAR_1", ": " + prefix +  new Integer(maxOrderId).toString()+ ", ");
				smsMsg = smsMsg.replace("VAR_2",  ": " +mobile+ ", ");
				smsMsg = smsMsg.replace("VAR_3",  ": " +workTypeName+ ", ");
				smsMsg = smsMsg.replace("VAR_4",  ": " +areaName+ ".");
				smsStatus = SMS.sendSMS(smsMsg, "9949860686");
								
				// send emsil
				String emailBody = EmailTemplate.EMAIL_NEW_ORDER.replace("VAR_1", custName);
				emailBody = emailBody.replace("VAR_2", prefix + new Integer(maxOrderId).toString());
				String subject = "Clik2Fix: Thank you for your order.";
				boolean emailStatus = EMailUtil.sendMail(email, subject, emailBody);
				if(emailStatus == true) {
					System.out.println("email: sent successfully");
				} else {
					System.out.println("email: Failed");
				}
				
				emailBody = "You have received a new order. Order ID: " + maxOrderId;
				subject = emailBody;
				emailStatus = EMailUtil.sendMail("prakashkalla@clik2fix.com", subject, emailBody);
				if(emailStatus == true) {
					System.out.println("email: sent successfully");
				} else {
					System.out.println("email: Failed");
				}
			}
			
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {
			try {
				BaseDAO.close(rs);
				BaseDAO.close(stmt);
				BaseDAO.close(con);
			} catch (GlobalException e) {
				e.printStackTrace();
			}
			
		}
		
		this.setOrderId(prefix + new Integer(maxOrderId).toString());
		
		return "GLOBAL_JSON_RESULT";
	}
	
	
}
