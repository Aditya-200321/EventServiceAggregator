package com.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.List;

import com.dao.AdminDAO;
import com.dao.CustomerDAO;
import com.model.CustomerModel;

@WebServlet("/AdminViewCustomersController")
public class AdminViewCustomersController extends HttpServlet {

    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        if(session == null || session.getAttribute("admin") == null){
            response.sendRedirect("adminLogin.jsp");
            return;
        }

        CustomerDAO dao = new CustomerDAO();
        List<CustomerModel> list = dao.getAllCustomersByAdmin();

        request.setAttribute("customers", list);

        RequestDispatcher rd =
                request.getRequestDispatcher("adminViewCustomers.jsp");
        rd.forward(request, response);
    }
}
