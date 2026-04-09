package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import com.dao.EventDAO;
import com.dao.ServiceDAO;


@WebServlet("/DeleteServiceController")
public class DeleteServiceController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 int service_id = Integer.parseInt(request.getParameter("service_id"));

	        ServiceDAO dao = new ServiceDAO();
	        dao.delete(service_id);

	        response.sendRedirect("viewService.jsp");
	}

}
