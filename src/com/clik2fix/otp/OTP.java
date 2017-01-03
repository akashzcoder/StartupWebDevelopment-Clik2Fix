package com.clik2fix.otp;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.JSONException;
import org.json.JSONObject;

public class OTP extends HttpServlet {

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

		response.setContentType("application/json");
		PrintWriter out = response.getWriter();
		
		boolean result = false;
		
		HttpSession session = request.getSession(false);
		String otp = session.getAttribute("otp").toString();
		if(otp.equals(request.getParameter("otp"))) {
			result = true;
		}
		
		JSONObject json = new JSONObject();
		try {
			json.put("verify_result", result);			
		} catch (JSONException e) {			
			e.printStackTrace();
		}		
		
		out.write(json.toString());
		
		out.flush();
		out.close();
	}

}
