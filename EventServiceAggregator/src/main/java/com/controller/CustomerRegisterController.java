package com.controller;

import java.io.IOException;

import com.dao.CustomerDAO;
import com.model.CustomerModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


@WebServlet("/CustomerRegisterController")
public class CustomerRegisterController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    String name = request.getParameter("name");
	    String email = request.getParameter("email");
	    String password = request.getParameter("password");
	    String phone = request.getParameter("phonenumber");
	    String address = request.getParameter("address");

	    CustomerModel c = new CustomerModel();
	    c.setCustomerName(name);
	    c.setEmail(email);
	    c.setPassword(password);
	    c.setPhone(phone);
	    c.setAddress(address);

	    CustomerDAO dao = new CustomerDAO();
	    String status = dao.insert(c);

	    if ("success".equals(status)) {

	        request.setAttribute("msg", "Registration Successful!");
	        request.setAttribute("msgType", "success");

	    } else {

	        request.setAttribute("msg", "Registration Failed!");
	        request.setAttribute("msgType", "danger");
	    }

	    RequestDispatcher rd = request.getRequestDispatcher("customerRegister.jsp");
	    rd.forward(request, response);

	}

}
