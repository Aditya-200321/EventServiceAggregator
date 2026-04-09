package com.controller;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import com.dao.AdminDAO;
import com.model.AdminModel;

@WebServlet("/AdminLoginController")
public class AdminLoginController extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if(email == null || password == null ||
           email.trim().isEmpty() || password.trim().isEmpty()){
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        AdminModel a = new AdminModel();
        a.setEmail(email.trim());
        a.setPassword(password.trim());

        AdminDAO ad = new AdminDAO();
        String status = ad.select(a);

        if ("success".equals(status)) {

            HttpSession oldSession = request.getSession(false);
            if(oldSession != null){
                oldSession.invalidate();
            }

            HttpSession session = request.getSession(true);
            session.setAttribute("admin", email);

            session.setMaxInactiveInterval(30 * 60);

            System.out.println("ADMIN LOGIN SUCCESS: " + email);

            response.sendRedirect(request.getContextPath() + "/adminDashboard.jsp");

        } else {

            System.out.println("ADMIN LOGIN FAILED");

            request.setAttribute("msg", "Invalid Admin Credentials");

            RequestDispatcher rd =
                    request.getRequestDispatcher("adminLogin.jsp");
            rd.forward(request, response);
        }
    }
}
