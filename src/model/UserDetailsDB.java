package model;

import java.sql.*;

public class UserDetailsDB {
	UserDetails user = new UserDetails();
	DBconnect dbconn = new DBconnect();
	Connection conn = dbconn.conn();

	public UserDetails getUserDetails(String email) {
		String sql = "select name, contact, address, password from login where email = ?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, email);
			ResultSet rs = pstmt.executeQuery();
			while (rs.next()) {
				user.setAddress(rs.getString("address"));
				user.setContact(rs.getString("contact"));
				user.setEmail(email);
				user.setName(rs.getString("name"));
				user.setPassword(rs.getString("password"));
				if (user.getAddress() == null) {
					user.setAddress("");
				}
				if (user.getContact() == null) {
					user.setContact("");
				}
			}
			return user;
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return null;
		}
	}

	public int getUserID(String email){
		String sql = "Select ID from login where email = ?";
		DBconnect dbconn = new DBconnect();
		Connection conn = dbconn.conn();
		try{
		PreparedStatement pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, email);
		ResultSet rs = pstmt.executeQuery();
		if(rs.next()){
			return rs.getInt("ID");
		}
		else return -1;
		}
		catch(Exception e){
			System.out.println(e);
			return -1;
		}
	}
}
