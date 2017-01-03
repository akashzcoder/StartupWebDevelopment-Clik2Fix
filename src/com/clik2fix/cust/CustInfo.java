package com.clik2fix.cust;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

import com.clik2fix.otp.OTPGenerator;
import com.clik2fix.sms.SMS;
import com.clik2fix.sms.SMSTemplate;
import com.clikfix.exceptions.GlobalException;

public class CustInfo extends HttpServlet {

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
		try {
			boolean otpSentResult = false;
			
			String name = request.getParameter("custName");
			String email = request.getParameter("email");
			String mobile = request.getParameter("mobile");			
			String address = request.getParameter("address");
			String repairSummary = request.getParameter("repairSummary");
			
			ServletConfig config = getServletConfig();
			ServletContext application = config.getServletContext();	
			
			//int otp = OTPGenerator.generateOTP();
			HttpSession session = request.getSession(true);
			//session.setAttribute("otp", otp);
			
			boolean otpSendFlag = false;
			
			ICustDao cdao = new CustDao();
			int custId = cdao.checkCust(email);
			if(custId != 0) { //customer exists already
				session.setAttribute("cust_id", custId);
				//otpSendFlag = true;
				System.out.println("Cust exists");
			} else { //customer does not exists
				System.out.println("New customer");
				if(cdao.saveCust(name, email, mobile)) {
					//otpSendFlag = true;
				}
			}
			
			RequestDispatcher rd = application.getRequestDispatcher("/payment.jsp");
			rd.forward(request, response);
			
/*					response.setContentType("application/json");
					PrintWriter out = response.getWriter();
					
					JSONObject json = new JSONObject();
					try {
						json.put("saveResult", true);			
					} catch (JSONException e) {			
						e.printStackTrace();
					}					
					
					out.write(json.toString());					
					out.flush();
					out.close();*/
				
		} catch (GlobalException e) {
			e.printStackTrace();
		}
	}

}
