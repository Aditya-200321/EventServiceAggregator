package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dao.ServiceDAO;
import com.model.ServiceModel;


@WebServlet("/AddServiceController")
public class AddServiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	String n=request.getParameter("serviceName");
		String d=request.getParameter("description");
		String p=request.getParameter("price");
		ServiceModel s = new ServiceModel();
		s.setServiceName(n);
		s.setDescription(d);
		s.setPrice(Double.parseDouble(p));
		ServiceDAO sm = new ServiceDAO();
		String status=sm.insert(s);
		if(status.equals("success")) {
			response.sendRedirect("viewService.jsp");
		}else {
			response.sendRedirect("addService.jsp");
		}
		
	}

}
