package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import com.dao.EventDAO;
import com.model.EventModel;

@WebServlet("/UpdateEventController")
public class UpdateEventController extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(request.getParameter("event_id"));

        EventDAO dao = new EventDAO();
        EventModel e = dao.selectById(id);

        request.setAttribute("event", e);

        RequestDispatcher rd =
                request.getRequestDispatcher("updateEvent.jsp");
        rd.forward(request, response);
    }


    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        EventModel e = new EventModel();

        e.setEventId(Integer.parseInt(request.getParameter("event_id")));
        e.setEventName(request.getParameter("event_name"));
        e.setDescription(request.getParameter("description"));
        e.setPrice(Double.parseDouble(request.getParameter("price")));

        EventDAO dao = new EventDAO();
        String status = dao.update(e);

        if (status.equals("success")) {
            System.out.println(status);
            RequestDispatcher rd =
                    request.getRequestDispatcher("viewEvent.jsp");
            rd.forward(request, response);
        } else {
            System.out.println(status);
            RequestDispatcher rd =
                    request.getRequestDispatcher("viewEvent.jsp");
            rd.forward(request, response);
        }
    }
}
