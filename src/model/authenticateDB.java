package model;
import java.sql.*;
import controller.*;

public class authenticateDB {
	private Connection conn = null;
	private String admin;

	public boolean login(String email, String password) {
		DBconnect dbconn = new DBconnect();
		conn = dbconn.conn();
		try {
			String sql = "select status from login where email = ? and password = ?";
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);
			ResultSet rs = pstmt.executeQuery();
			if(rs.next()) {
				admin = rs.getString("status");
				return true;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
		return false;
	}
	
	public boolean admin(){
		if (admin.equals("a"))
			return true;
		else
			return false;
	}
}
