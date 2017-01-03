package com.clik2fix.contact.action;

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

public class ContactUs extends HttpServlet {

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
		
		boolean result = false;
		
		String custName = request.getParameter("custName");
		String email = request.getParameter("email");
		String msg = request.getParameter("msg");
		
		Connection con = null;
		Statement stmt = null;
				
		int effRows = 0;
		try {
			con = BaseDAO.getDBConnection();
			stmt = con.createStatement();
			
			String sql = "insert into tbl_enq (cust_name, email, msg) values('"+custName+"','"+email+"','"+msg+"')";
			effRows = stmt.executeUpdate(sql);
			
		} catch (Exception e) {			
			e.printStackTrace();
		} finally {
			try {
				BaseDAO.close(stmt);
				BaseDAO.close(con);
			} catch (GlobalException e) {
				e.printStackTrace();
			}
			
		}
		
		if(effRows > 0) {
			result = true;
			String emailBody = EmailTemplate.NEW_ENQUIRY.replace("VAR_1", email);
			emailBody = emailBody.replace("VAR_2", msg);
			try {
				EMailUtil.sendMail("support@clik2fix.com", "New Enquiry", emailBody);
			} catch (GlobalException e) {
				e.printStackTrace();
			}
		}

		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		JSONObject json = new JSONObject();
		try {
			json.put("result", result);			
		} catch (JSONException e) {			
			e.printStackTrace();
		}					
		
		out.write(json.toString());					
		out.flush();
		out.close();
	}

}
