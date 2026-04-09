package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import com.dao.ServiceDAO;
import com.model.ServiceModel;

@WebServlet("/UpdateServiceController")
public class UpdateServiceController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String sid = request.getParameter("service_id");

        if(sid == null){
            response.sendRedirect("viewService.jsp");
            return;
        }

        int id = Integer.parseInt(sid);

        ServiceDAO dao = new ServiceDAO();
        ServiceModel s = dao.selectById(id);

        request.setAttribute("service", s);

        RequestDispatcher rd =
                request.getRequestDispatcher("updateService.jsp");
        rd.forward(request, response);
    }

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        try {

            ServiceModel s = new ServiceModel();

            s.setServiceId(
                    Integer.parseInt(request.getParameter("service_id")));

            s.setServiceName(request.getParameter("service_name"));
            s.setDescription(request.getParameter("description"));
            s.setPrice(
                    Double.parseDouble(request.getParameter("price")));

            ServiceDAO dao = new ServiceDAO();
            String status = dao.update(s);

            if ("success".equals(status)) {
                response.sendRedirect("viewService.jsp");
            } else {
                request.setAttribute("error", "Update Failed");
                RequestDispatcher rd =
                        request.getRequestDispatcher("updateService.jsp");
                rd.forward(request, response);
            }

        } catch(Exception e){
            e.printStackTrace();
            response.sendRedirect("viewService.jsp");
        }
    }
}
