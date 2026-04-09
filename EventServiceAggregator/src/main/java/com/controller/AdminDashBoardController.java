package com.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

import com.dao.DashBoardDAO;
import com.model.DashBoardModel;

@WebServlet("/AdminDashBoardController")
public class AdminDashBoardController extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("admin") == null){
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        DashBoardDAO dao = new DashBoardDAO();
        DashBoardModel status = dao.getStatus();

        request.setAttribute("status", status);

        RequestDispatcher rd =
                request.getRequestDispatcher("adminDashBoardStatus.jsp");
        rd.forward(request,response);
    }
}
