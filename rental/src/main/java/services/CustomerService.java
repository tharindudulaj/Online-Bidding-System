package services;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import control.DBConnect;
import model.Customer;

public class CustomerService {

    public void regCustomer(Customer cus) {
        String query = "INSERT INTO customer (email, name, age, password) VALUES (?, ?, ?, ?)";
        try (PreparedStatement statement = DBConnect.getConnection().prepareStatement(query)) {
            statement.setString(1, cus.getEmail());
            statement.setString(2, cus.getName());
            statement.setInt(3, cus.getAge());
            statement.setString(4, cus.getPassword());
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public boolean validate(Customer cus) {
        String query = "SELECT * FROM customer WHERE email=? AND password=?";
        try (PreparedStatement statement = DBConnect.getConnection().prepareStatement(query)) {
            statement.setString(1, cus.getEmail());
            statement.setString(2, cus.getPassword());
            ResultSet rs = statement.executeQuery();
            return rs.next();
        } catch (Exception e) {
            System.out.println(e);
        }
        return false;
    }

    public Customer getOne(Customer cus) {
        String query = "SELECT * FROM customer WHERE email=? AND password=?";
        try (PreparedStatement statement = DBConnect.getConnection().prepareStatement(query)) {
            statement.setString(1, cus.getEmail());
            statement.setString(2, cus.getPassword());
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                cus.setName(rs.getString("name"));
                cus.setAge(rs.getInt("age"));
                cus.setEmail(rs.getString("email"));
                cus.setPassword(rs.getString("password"));
                return cus;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public void updateCustomer(Customer customer) {
        String query = "UPDATE customer SET name=?, age=?, password=? WHERE email=?";
        try (PreparedStatement statement = DBConnect.getConnection().prepareStatement(query)) {
            statement.setString(1, customer.getName());
            statement.setInt(2, customer.getAge());
            statement.setString(3, customer.getPassword());
            statement.setString(4, customer.getEmail());
            statement.executeUpdate();
        } catch (Exception e) {
            System.out.println(e);
        }
    }

    public ArrayList<Customer> getAllCustomer() {
        String query = "SELECT * FROM customer";
        ArrayList<Customer> listCus = new ArrayList<>();
        try (Statement statement = DBConnect.getConnection().createStatement();
             ResultSet rs = statement.executeQuery(query)) {
            while (rs.next()) {
                Customer cus = new Customer();
                cus.setName(rs.getString("name"));
                cus.setAge(rs.getInt("age"));
                cus.setEmail(rs.getString("email"));
                cus.setPassword(rs.getString("password"));
                listCus.add(cus);
            }
            return listCus;
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }

    public Customer singleDataButton(Customer cus) {
        String query = "SELECT * FROM customer WHERE email=?";
        try (PreparedStatement statement = DBConnect.getConnection().prepareStatement(query)) {
            statement.setString(1, cus.getEmail());
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                cus.setName(rs.getString("name"));
                cus.setAge(rs.getInt("age"));
                cus.setEmail(rs.getString("email"));
                cus.setPassword(rs.getString("password"));
                return cus;
            }
        } catch (Exception e) {
            System.out.println(e);
        }
        return null;
    }
    public void deleteCustomer(Customer cus) {
    	try {
			String query = "DELETE FROM customer WHERE email = '"+cus.getEmail()+"'";
			Statement statement = DBConnect.getConnection().createStatement();
			statement.executeUpdate(query);
		} catch (Exception e) {
			e.printStackTrace();
		}
    }
}
