package com.Items;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@WebServlet("/InsertItem")
@MultipartConfig // Enable multipart/form-data for file uploads
public class InsertItem extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIRECTORY = "images"; // Directory where images will be saved

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve item information from the request parameters
        String itemName = request.getParameter("itemName");
        String description = request.getParameter("description");
        double price = Double.parseDouble(request.getParameter("price"));
        Part filePart = request.getPart("itemImage"); // Retrieve <input type="file" name="itemImage">

        boolean isTrue;

        // Validate inputs
        if (itemName == null || itemName.isEmpty() || description == null || description.isEmpty() || price <= 0 || filePart == null) {
            RequestDispatcher dis = request.getRequestDispatcher("Unsuccess.jsp");
            dis.forward(request, response);
            return;
        }

        // Handle file upload
        String fileName = filePart.getSubmittedFileName();
        String uploadPath = getServletContext().getRealPath("") + File.separator + UPLOAD_DIRECTORY;

        // Ensure upload directory exists
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Create the directory if it doesn't exist
        }

        // Save the uploaded file
        File file = new File(uploadDir, fileName);
        try (InputStream input = filePart.getInputStream()) {
            Files.copy(input, file.toPath(), StandardCopyOption.REPLACE_EXISTING);
        } catch (IOException e) {
            e.printStackTrace(); // Log the exception
            RequestDispatcher dis = request.getRequestDispatcher("Unsuccess.jsp");
            dis.forward(request, response);
            return;
        }

        // Store relative image path in the database
        String itemImagePath = UPLOAD_DIRECTORY + "/" + fileName;
        isTrue = ItemsDBUtil.insertItem(itemName, description, itemImagePath, price);

        if (isTrue) {
            // If the item is successfully inserted, redirect to the admin view to update the data
            response.sendRedirect(request.getContextPath() + "/AdminViewServlet");
        } else {
            // Forward to an error page if insertion is unsuccessful
            RequestDispatcher dis = request.getRequestDispatcher("Unsuccess.jsp");
            dis.forward(request, response);
        }
    }
}
