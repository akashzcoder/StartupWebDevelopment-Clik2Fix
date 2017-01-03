package com.clik2fix.order.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONException;
import org.json.JSONObject;

import com.clik2fix.sms.SMS;
import com.clik2fix.sms.SMSTemplate;
import com.clik2fix.util.EMailUtil;
import com.clik2fix.util.EmailTemplate;
import com.clikfix.db.BaseDAO;
import com.clikfix.exceptions.GlobalException;

public class PlaceOrder extends HttpServlet {

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String custName = request.getParameter("custName");
		String email = request.getParameter("email");
		String mobile = request.getParameter("mobile");
		String address = request.getParameter("address");
		String workType = request.getParameter("workType");
		String area = request.getParameter("area");
		String workSummary = request.getParameter("workSummary");
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		int effRows = 0;
		int maxOrderId = 0;
		try {
			con = BaseDAO.getDBConnection();
			stmt = con.createStatement();
			
			int orderStatus = 1;
			
			String sql = "insert into tbl_orders (name,email,mobile,address,status,work_type,area,work_summary) values('"+custName+"','"+email+"','"+mobile+"','"+address+"','"+orderStatus+"','"+workType+"','"+area+"','"+workSummary+"')";
			effRows = stmt.executeUpdate(sql);
			BaseDAO.close(stmt);
			
			if(effRows > 0) {
				sql = "select max(order_id) max_order_id from tbl_orders";
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);
				
				if(rs.next()) {
					maxOrderId = rs.getInt("max_order_id");
				}

				//send sms
				String smsMsg = SMSTemplate.NEW_ORDER.replace("VAR_1", custName);
				smsMsg = smsMsg.replace("VAR_2", new Integer(maxOrderId).toString());
				//System.out.println(smsMsg);
				boolean smsStatus = SMS.sendSMS(smsMsg, mobile);
				if(smsStatus == true) {
					System.out.println("SMS: sent successfully");
				} else {
					System.out.println("SMS: Failed");
				}
				
				smsMsg = SMSTemplate.NEW_ORDER_TO_ADMIN.replace("VAR_1", " " +maxOrderId+ ",");
				smsMsg = smsMsg.replace("VAR_2",  " " +mobile+ ",");
				smsMsg = smsMsg.replace("VAR_3",  " " +workType+ ",");
				smsMsg = smsMsg.replace("VAR_4",  " " +area+ ".");
				smsStatus = SMS.sendSMS(smsMsg, "8885556650");				
				
				// send emsil
				String emailBody = EmailTemplate.EMAIL_NEW_ORDER.replace("VAR_1", custName);
				emailBody = emailBody.replace("VAR_2",  new Integer(maxOrderId).toString());
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
				
		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONObject json = new JSONObject();
		try {
			json.put("orderId", maxOrderId);			
		} catch (JSONException e) {			
			e.printStackTrace();
		}					
		
		out.write(json.toString());					
		out.flush();
		out.close();
		
		
	}

}
