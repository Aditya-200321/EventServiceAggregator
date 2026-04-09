package com.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

import com.dao.EventDAO;
import com.model.EventModel;

@WebServlet("/AddEventController")
public class AddEventController extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String eventName = request.getParameter("eventName");
        String description = request.getParameter("description");
        String price = request.getParameter("price");

        EventModel event = new EventModel();
        event.setEventName(eventName);
        event.setDescription(description);
        event.setPrice(Double.parseDouble(price));

        EventDAO dao = new EventDAO();
        String status = dao.insert(event);
        System.out.println(eventName);
        System.out.println(description);
        System.out.println(price);

        System.out.println("Insert Status = " + status);

        if ("success".equals(status)) {
            response.sendRedirect("viewEvent.jsp");
        } else {
            response.sendRedirect("addEvent.jsp");
        }
    }
}
