package model;
import java.sql.*;

public class DBconnect {
	public Connection conn() {
		try {
			// Step1: Load JDBC Driver
			Class.forName("com.mysql.jdbc.Driver");

			// Step 2: Define Connection URL
			String connURL = "jdbc:mysql://localhost/ead project?user=root&password=root";

			// Step 3: Establish connection to URL
			Connection conn = DriverManager.getConnection(connURL);
			return conn;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
