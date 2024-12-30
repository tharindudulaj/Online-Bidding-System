package com.Items;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class UpdateItemsServlet
 * This servlet is responsible for updating an existing item in the database.
 */
@WebServlet("/UpdateItemsServlet")
public class UpdateItemsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles the HTTP POST request to update an existing item in the database.
     *
     * @param request  The HttpServletRequest object.
     * @param response The HttpServletResponse object.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve parameters from the request
        String itemNoStr = request.getParameter("itemNo");
        String itemName = request.getParameter("itemName");
        String description = request.getParameter("description");
        String itemImage = request.getParameter("itemImage");
        String priceStr = request.getParameter("price");

        boolean isUpdated = false;

        // Input validation
        if (itemNoStr == null || itemNoStr.isEmpty() || 
            itemName == null || itemName.isEmpty() || 
            description == null || description.isEmpty() || 
            priceStr == null || priceStr.isEmpty()) {
            
            // Forward to the failure page if input is missing
            request.setAttribute("errorMessage", "All fields are required. Please fill in the missing information.");
            RequestDispatcher dis = request.getRequestDispatcher("Unsuccess.jsp");
            dis.forward(request, response);
            return;  // Exit the method early
        }

        try {
            // Validate and convert itemNo and price
            int itemNo = Integer.parseInt(itemNoStr);
            double price = Double.parseDouble(priceStr);

            // Call the ItemsDBUtil to update the item
            isUpdated = ItemsDBUtil.updateItem(itemNo, itemName, description, itemImage, price);

        } catch (NumberFormatException e) {
            e.printStackTrace(); // Log the exception
            // Forward to failure page with an error message
            request.setAttribute("errorMessage", "Invalid number format for Item Number or Price.");
            RequestDispatcher dis = request.getRequestDispatcher("Unsuccess.jsp");
            dis.forward(request, response);
            return; // Exit method
        }

        if (isUpdated) {
            // If the update is successful, redirect to the AdminViewServlet
            response.sendRedirect(request.getContextPath() + "/AdminViewServlet");
        } else {
            // If the update is unsuccessful, forward to ItemUnsuccess.jsp with an error message
            request.setAttribute("errorMessage", "Failed to update the item. Please try again.");
            RequestDispatcher dis = request.getRequestDispatcher("Unsuccess.jsp");
            dis.forward(request, response);
        }
    }
}
