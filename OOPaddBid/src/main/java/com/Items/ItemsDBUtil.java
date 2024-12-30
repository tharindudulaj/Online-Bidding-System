package com.Items;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 * A utility class for interacting with the database to manage items and customers.
 */
public class ItemsDBUtil {
    /**
     * Inserts a new item into the database.
     *
     * @param itemName    The name of the item.
     * @param description The description of the item.
     * @param itemImage   The image URL of the item.
     * @param price       The price of the item.
     * @return True if the item is successfully inserted; otherwise, false.
     */
    public static boolean insertItem(String itemName, String description, String itemImage, double price) {
        String sql = "INSERT INTO items (itemName, description, itemImage, price) VALUES (?, ?, ?, ?)";
        try (Connection con = DBConnect.getConnection(); 
             PreparedStatement pstmt = con.prepareStatement(sql)) {
             
            pstmt.setString(1, itemName);
            pstmt.setString(2, description);
            pstmt.setString(3, itemImage);
            pstmt.setDouble(4, price);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
            return false;
        }
    }

    /**
     * Retrieves a list of all items from the database.
     *
     * @return A list of items.
     */
    public static List<Item> getAllItems() {
        List<Item> items = new ArrayList<>();
        String sql = "SELECT * FROM items";

        try (Connection con = DBConnect.getConnection();
             PreparedStatement pstmt = con.prepareStatement(sql);
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                int itemNo = rs.getInt("itemNo");
                String itemName = rs.getString("itemName");
                String description = rs.getString("description");
                String itemImage = rs.getString("itemImage");
                double price = rs.getDouble("price");

                Item item = new Item(itemNo, itemName, description, itemImage, price);
                items.add(item);
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
        }

        return items;
    }

    /**
     * Updates an existing item in the database.
     *
     * @param itemNo     The unique identifier of the item to update.
     * @param itemName   The new name of the item.
     * @param description The new description of the item.
     * @param itemImage  The new image URL of the item.
     * @param price      The new price of the item.
     * @return True if the item is successfully updated; otherwise, false.
     */
    public static boolean updateItem(int itemNo, String itemName, String description, String itemImage, double price) {
        String sql = "UPDATE items SET itemName = ?, description = ?, itemImage = ?, price = ? WHERE itemNo = ?";
        try (Connection con = DBConnect.getConnection(); 
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, itemName);
            pstmt.setString(2, description);
            pstmt.setString(3, itemImage);
            pstmt.setDouble(4, price);
            pstmt.setInt(5, itemNo);

            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
            return false;
        }
    }

    /**
     * Deletes an item from the database.
     *
     * @param itemNo The unique identifier of the item to delete.
     * @return True if the item is successfully deleted; otherwise, false.
     */
    public static boolean deleteItem(int itemNo) {
        String sql = "DELETE FROM items WHERE itemNo = ?";
        try (Connection con = DBConnect.getConnection(); 
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setInt(1, itemNo);
            return pstmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
            return false;
        }
    }

    /**
     * Searches for items based on a search query.
     *
     * @param searchQuery The search string.
     * @return A list of items matching the search criteria.
     */
    public static List<Item> searchItems(String searchQuery) {
        List<Item> searchResults = new ArrayList<>();
        String sql = "SELECT * FROM items WHERE itemName LIKE ? OR description LIKE ?";

        try (Connection con = DBConnect.getConnection(); 
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, "%" + searchQuery + "%");
            pstmt.setString(2, "%" + searchQuery + "%");

            try (ResultSet rs = pstmt.executeQuery()) {
                while (rs.next()) {
                    int itemNo = rs.getInt("itemNo");
                    String itemName = rs.getString("itemName");
                    String description = rs.getString("description");
                    String itemImage = rs.getString("itemImage");
                    double price = rs.getDouble("price");

                    Item item = new Item(itemNo, itemName, description, itemImage, price);
                    searchResults.add(item);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Log the exception
        }

        return searchResults;
    }
}
