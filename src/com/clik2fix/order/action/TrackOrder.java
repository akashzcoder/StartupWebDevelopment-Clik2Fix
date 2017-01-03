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

import com.clik2fix.sms.SMS;
import com.clik2fix.sms.SMSTemplate;
import com.clik2fix.util.EMailUtil;
import com.clik2fix.util.EmailTemplate;
import com.clikfix.db.BaseDAO;
import com.clikfix.exceptions.GlobalException;

public class TrackOrder extends HttpServlet {

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
		int orderId = Integer.parseInt(request.getParameter("orderNumber"));
		
		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;
		String status = null;
		try {
			con = BaseDAO.getDBConnection();
			stmt = con.createStatement();

			String sql = "SELECT t1.order_status_name FROM tbl_order_status t1, tbl_orders t2 where t2.status = t1.order_status_id and t2.order_id = " + orderId;
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);
			
			if(rs.next()) {
				status = rs.getString("order_status_name");
			}
			
		} catch (Exception e) {			
			status = "Invalid order number. Please enter the correct order number sent to your mobile.";
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
		}
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<br><b>Order Status:</b> " + status + "<br>");

		out.flush();
		out.close();
	}

}
