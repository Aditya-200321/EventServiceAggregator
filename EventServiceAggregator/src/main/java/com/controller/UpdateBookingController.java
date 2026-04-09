package com.controller;

import java.io.IOException;

import com.dao.BookingDAO;
import com.model.BookingModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/UpdateBookingController")
public class UpdateBookingController extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession(false);

            if(session == null || session.getAttribute("customerId") == null){
                response.sendRedirect("customerLogin.jsp");
                return;
            }

            int bookingId = Integer.parseInt(request.getParameter("bookingId"));
            int customerId = Integer.parseInt(request.getParameter("customerId"));
            int eventId = Integer.parseInt(request.getParameter("eventId"));
            String eventDate = request.getParameter("eventDate");
            String location = request.getParameter("location");

            BookingModel b = new BookingModel();
            b.setBookingId(bookingId);
            b.setCustomerId(customerId);
            b.setEventId(eventId);
            b.setEventDate(eventDate);
            b.setLocation(location);

            BookingDAO dao = new BookingDAO();
            String status = dao.updateBooking(b);

            if(status.equals("success")){
                response.sendRedirect("ViewBookingController");
            }
            else{
                request.setAttribute("error", "Update Failed!");

                RequestDispatcher rd =
                        request.getRequestDispatcher("updateBooking.jsp?id=" + bookingId);
                rd.forward(request, response);
            }

        } catch(Exception e){
            e.printStackTrace();
        }
    }
}
