package com.inquiry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class inqDBUtil {

    // Insert data into the 'inquiry' table and retrieve the inserted data.
	public static List<Inquiry> insertInquiry(String type, String name, String phone, String email, String nic, String title, String inquiry) {
	    List<Inquiry> inq = new ArrayList<>();
	    String insertSQL = "INSERT INTO inquiry (type, name, phone, email, nic, title, inquiry) VALUES (?, ?, ?, ?, ?, ?, ?)";
	    String selectSQL = "SELECT * FROM inquiry WHERE nic = ?";

	    try (Connection con = DBConnect.getConnection();
	         PreparedStatement insertStmt = con.prepareStatement(insertSQL);
	         PreparedStatement selectStmt = con.prepareStatement(selectSQL)) {

	        // Insert inquiry
	        insertStmt.setString(1, type);
	        insertStmt.setString(2, name);
	        insertStmt.setString(3, phone);
	        insertStmt.setString(4, email);
	        insertStmt.setString(5, nic);
	        insertStmt.setString(6, title);
	        insertStmt.setString(7, inquiry);

	        int rowsAffected = insertStmt.executeUpdate();

	        // Validate inserted data from table
	        if (rowsAffected > 0) {
	            selectStmt.setString(1, nic);
	            try (ResultSet rs = selectStmt.executeQuery()) {
	                while (rs.next()) {
	                    Inquiry inquiryObject = new Inquiry(
	                            rs.getString("type"),
	                            rs.getString("name"),
	                            rs.getString("phone"),
	                            rs.getString("email"),
	                            rs.getString("nic"),
	                            rs.getString("title"),
	                            rs.getString("inquiry"));
	                    inq.add(inquiryObject);
	                }
	            }
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return inq;
	}


    // Update data in the 'inquiry' table and retrieve the updated data.
    public static List<Inquiry> updateInquiry(String type, String name, String phone, String email, String nic, String title, String inquiry) {
        List<Inquiry> inq = new ArrayList<>();
        String updateSQL = "UPDATE inquiry SET type = ?, name = ?, phone = ?, email = ?, title = ?, inquiry = ? WHERE nic = ?";
        String selectSQL = "SELECT * FROM inquiry WHERE nic = ?";

        try (Connection con = DBConnect.getConnection();
             PreparedStatement updateStmt = con.prepareStatement(updateSQL);
             PreparedStatement selectStmt = con.prepareStatement(selectSQL)) {

            // Update inquiry
            updateStmt.setString(1, type);
            updateStmt.setString(2, name);
            updateStmt.setString(3, phone);
            updateStmt.setString(4, email);
            updateStmt.setString(5, title);
            updateStmt.setString(6, inquiry);
            updateStmt.setString(7, nic);

            int rowsAffected = updateStmt.executeUpdate();

            // Validate updated data from table
            if (rowsAffected > 0) {
                selectStmt.setString(1, nic);
                try (ResultSet rs = selectStmt.executeQuery()) {
                    if (rs.next()) {
                        Inquiry inquiryObject = new Inquiry(
                                rs.getString("type"),
                                rs.getString("name"),
                                rs.getString("phone"),
                                rs.getString("email"),
                                rs.getString("nic"),
                                rs.getString("title"),
                                rs.getString("inquiry"));
                        inq.add(inquiryObject);
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Consider logging the exception using a logging framework
        }

        return inq;
    }

    // Delete data from 'Inquiry' table
    public static boolean deleteInquiry(String nic) {
        boolean isSuccess = false;
        String sql = "DELETE FROM inquiry WHERE nic = ?";

        try (Connection con = DBConnect.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, nic);
            int rowsAffected = stmt.executeUpdate();

            System.out.println("Rows affected: " + rowsAffected); // Log rows affected
            isSuccess = (rowsAffected > 0);
        } catch (SQLException e) {
            e.printStackTrace();
            // Consider logging the exception using a logging framework
        }

        return isSuccess;
    }
    
    public static List<Inquiry> getAllInquiries() {
        List<Inquiry> inquiries = new ArrayList<>();
        String sql = "SELECT * FROM inquiry";

        try (Connection con = DBConnect.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Inquiry inquiry = new Inquiry(
                        rs.getString("type"),
                        rs.getString("name"),
                        rs.getString("phone"),
                        rs.getString("email"),
                        rs.getString("nic"),
                        rs.getString("title"),
                        rs.getString("inquiry")
                );
                inquiries.add(inquiry);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return inquiries;
    }

    
    public static Inquiry getInquiryByNIC(String nic) {
        Inquiry inquiry = null;
        String sql = "SELECT * FROM inquiry WHERE nic = ?";

        try (Connection con = DBConnect.getConnection();
             PreparedStatement stmt = con.prepareStatement(sql)) {

            stmt.setString(1, nic);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    inquiry = new Inquiry(
                            rs.getString("type"),
                            rs.getString("name"),
                            rs.getString("phone"),
                            rs.getString("email"),
                            rs.getString("nic"),
                            rs.getString("title"),
                            rs.getString("inquiry")
                    );
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return inquiry;
    }



}
