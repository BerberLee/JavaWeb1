package com.saber.site.controllers;


import com.saber.site.dao.EmployeeDAO;
import com.saber.site.model.Employee;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet(urlPatterns = "/employeeController")
public class EmployeeController extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String employeeId = request.getParameter("employeeId");
        try {
            Employee employee = EmployeeDAO.getEmployee(Integer.parseInt(employeeId));
            request.setAttribute("employee", employee);
            request.getRequestDispatcher("/WEB-INF/jsp/view/view.jsp").forward(request, response);
        } catch (SQLException e) {
            System.out.println(e.getMessage());
            response.sendRedirect(request.getContextPath()+"/index.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
