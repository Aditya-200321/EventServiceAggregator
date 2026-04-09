package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;

import com.dao.BookingDAO;
import com.model.BookingModel;

@WebServlet("/AdminViewBookingsController")
public class AdminViewBookingsController extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        System.out.println("Admin view bookings HIT");

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("admin") == null){
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        BookingDAO dao = new BookingDAO();
        List<BookingModel> list = dao.getAllBookingsByAdmin();  // <-- IMPORTANT

        System.out.println("Total bookings = " + list.size());

        request.setAttribute("bookings", list);

        RequestDispatcher rd =
                request.getRequestDispatcher("adminViewBookings.jsp");
        rd.forward(request, response);
    }
}
