package com.inquiry;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/viewAllInquiries")
public class ViewAllInquiriesServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Inquiry> inquiries = inqDBUtil.getAllInquiries();
        request.setAttribute("inquiries", inquiries);
        RequestDispatcher dispatcher = request.getRequestDispatcher("view-inquiries.jsp");
        dispatcher.forward(request, response);
    }
}
