package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import com.dao.BookingDAO;


@WebServlet("/DeleteBookingController")
public class DeleteBookingController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session = request.getSession(false);

	        if(session == null || session.getAttribute("customerId") == null){
	            response.sendRedirect("customerLogin.jsp");
	            return;
	        }

	        int bookingId =
	                Integer.parseInt(request.getParameter("booking_id"));

	        BookingDAO dao = new BookingDAO();
	        String status = dao.deleteBooking(bookingId);

	        if("success".equals(status)){
	            session.setAttribute("successMsg","Booking Deleted!");
	        }else{
	            session.setAttribute("successMsg","Delete Failed!");
	        }

	        response.sendRedirect("ViewBookingController");
	    
	}

}
