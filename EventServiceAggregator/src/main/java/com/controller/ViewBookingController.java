package com.controller;

import java.io.IOException;
import java.util.List;

import com.dao.BookingDAO;
import com.model.BookingModel;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ViewBookingController")
public class ViewBookingController extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("customerId") == null){
            response.sendRedirect("customerLogin.jsp");
            return;
        }

        int cid = (int) session.getAttribute("customerId");

        BookingDAO dao = new BookingDAO();
        List<BookingModel> list = dao.getBookingsByCustomer(cid);

        request.setAttribute("bookingList", list);

        RequestDispatcher rd =
                request.getRequestDispatcher("viewBooking.jsp");
        rd.forward(request, response);
    }
}
