package model;

import java.sql.*;

public class UpdateUserDB {
	public boolean updateUser(String name, String email, String contact,
			String address, String password, int ID) {
		String sql = "Update login set name = ?, email = ?, contact = ?, address = ?, password = ? where ID = ?";
		DBconnect dbconn = new DBconnect();
		Connection conn = dbconn.conn();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, name);
			pstmt.setString(2, email);
			pstmt.setInt(3, Integer.parseInt(contact));
			pstmt.setString(4, address);
			pstmt.setString(5, password);
			pstmt.setInt(6, ID);

			if (pstmt.executeUpdate() > 0)
				return true;
			else
				return false;
		} catch (Exception e) {
			System.out.println(e);
			return false;
		}
	}
}
