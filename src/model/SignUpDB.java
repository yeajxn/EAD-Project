package model;

import java.sql.*;

public class SignUpDB {
	public boolean signUp(String email, String name, String passwd,
			String contact) {
		DBconnect DBconnect = new DBconnect();
		Connection conn = DBconnect.conn();
		String sql = "insert into login (email, name, password, contact, status) values (?,?,?,?,'m')";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			pstmt.setString(3, passwd);
			pstmt.setInt(4, Integer.parseInt(contact));
			int check = pstmt.executeUpdate();
			if (check == 1)
				return true;
			else
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}public boolean signUpNoContact(String email, String name, String passwd) {
		DBconnect DBconnect = new DBconnect();
		Connection conn = DBconnect.conn();
		String sql = "insert into login (email, name, password, status) values (?,?,?,'m')";
		PreparedStatement pstmt;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, name);
			pstmt.setString(3, passwd);
			int check = pstmt.executeUpdate();
			if (check == 1)
				return true;
			else
				return false;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return false;
		}
	}
}
