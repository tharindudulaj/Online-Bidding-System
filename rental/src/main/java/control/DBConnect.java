package control;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
	public static Connection getConnection() throws ClassNotFoundException, SQLException {
		String username = "root";
		String password = "Thari@123";
		
		Class.forName("com.mysql.jdbc.Driver");
		Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/database?useSSL=false&serverTimezone=UTC",username,password);
		
		return con;
	}

}
