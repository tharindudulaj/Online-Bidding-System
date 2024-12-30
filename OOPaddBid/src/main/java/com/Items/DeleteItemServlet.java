package com.Items;

import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DeleteItemServlet
 * This servlet is responsible for handling the deletion of an item.
 */
@WebServlet("/DeleteItemServlet")
public class DeleteItemServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    /**
     * Handles the HTTP POST request to delete an item.
     *
     * @param request  The HttpServletRequest object.
     * @param response The HttpServletResponse object.
     * @throws ServletException If a servlet-specific error occurs.
     * @throws IOException      If an I/O error occurs.
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the item number to be deleted from the request
        String itemNoStr = request.getParameter("itemNo");
        boolean isDeleted = false;

        try {
            // Convert itemNo to integer
            int itemNo = Integer.parseInt(itemNoStr);

            // Call the ItemsDBUtil to delete the item
            isDeleted = ItemsDBUtil.deleteItem(itemNo);

        } catch (NumberFormatException e) {
            e.printStackTrace(); // Log the exception (consider using a logging framework)
            // Optionally, you can set an error message to be displayed to the user
        }

        if (isDeleted) {
            // Redirect to the admin view after successful deletion
            response.sendRedirect(request.getContextPath() + "/AdminViewServlet");
        } else {
            // Forward to an error page if deletion is unsuccessful
            RequestDispatcher dis = request.getRequestDispatcher("Unsuccess.jsp");
            dis.forward(request, response);
        }
    }
}
