package com.controller;

import java.io.IOException;

import com.dao.CustomerDAO;
import com.model.CustomerModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/CustomerLoginController")
public class CustomerLoginController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        CustomerModel c = new CustomerModel();
        c.setEmail(email);
        c.setPassword(password);

        CustomerDAO dao = new CustomerDAO();
        String status = dao.select(c);

        HttpSession session = request.getSession();

        if ("success".equals(status)) {

            int customerId = dao.getCustomerIdByEmail(email);

            session.setAttribute("customerId", customerId);
            session.setAttribute("customerEmail", email);

            RequestDispatcher rd =
                request.getRequestDispatcher("customerDashboard.jsp");
            rd.forward(request, response);

        } else {

            session.invalidate();

            request.setAttribute("msg", "Invalid Email or Password");

            RequestDispatcher rd =
                request.getRequestDispatcher("customerLogin.jsp");
            rd.forward(request, response);
        }
    }
}
