package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import com.dao.BookingDAO;
import com.model.BookingModel;

@WebServlet("/BookingController")
public class BookingController extends HttpServlet {

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            HttpSession session = request.getSession(false);

            if (session == null || session.getAttribute("customerId") == null) {
                response.sendRedirect("customerLogin.jsp");
                return;
            }

            int customerId = (int) session.getAttribute("customerId");
            int eventId = Integer.parseInt(request.getParameter("event_id"));
            String eventDate = request.getParameter("event_date");
            String location = request.getParameter("location");
            String[] serviceIds = request.getParameterValues("service_ids");

            BookingModel b = new BookingModel();
            b.setCustomerId(customerId);
            b.setEventId(eventId);
            b.setEventDate(eventDate);
            b.setLocation(location);

            BookingDAO dao = new BookingDAO();
            int bookingId = dao.insert(b);

            if (bookingId > 0) {

                if (serviceIds != null) {
                    dao.insertBookingServices(bookingId, serviceIds);
                }

                session.setAttribute("successMsg", "✅ Booking Successful!");

                response.sendRedirect("bookingForm.jsp");

            } else {

                request.setAttribute("failMsg", "❌ Booking Failed!");
                request.getRequestDispatcher("bookingForm.jsp")
                        .forward(request, response);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
