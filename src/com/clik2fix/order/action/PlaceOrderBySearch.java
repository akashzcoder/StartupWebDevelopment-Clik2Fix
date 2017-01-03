package com.clik2fix.order.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class PlaceOrderBySearch extends HttpServlet {

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String find = request.getParameter("find").toString();
		String area = null;
		
		if(request.getParameter("area") != null) {
			area = request.getParameter("area").toString();
			request.setAttribute("area", area);
		}
				
		request.setAttribute("id", find);
				
		ServletConfig config = getServletConfig();
		ServletContext application = config.getServletContext();	
		RequestDispatcher rd = application.getRequestDispatcher("/ticket.jsp");
		rd.forward(request, response);
	}

}
