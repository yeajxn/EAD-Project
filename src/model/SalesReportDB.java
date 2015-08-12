package model;

import java.sql.*;
import java.util.ArrayList;

public class SalesReportDB {
	public ArrayList<SalesRepProducts> ProductsList(String month, String year) {
		String sql = "SELECT productID, quantity, unitPrice FROM transactiondetails WHERE YEAR(Date) = ? AND MONTH(Date) = ?";
		DBconnect dbconn = new DBconnect();
		Connection conn = dbconn.conn();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, year);
			pstmt.setString(2, month);
			ResultSet rs = pstmt.executeQuery();

			ArrayList<SalesRepProducts> List = new ArrayList<SalesRepProducts>();
			while (rs.next()) {
				SalesRepProducts product = new SalesRepProducts();
				product.setProductID(rs.getString("productID") + "");
				product.setQuantity(rs.getInt("quantity"));
				product.setUnitPrice(rs.getDouble("unitPrice"));
				List.add(product);
			}
			return List;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}

	public ArrayList<SalesRepTransactions> TransactionsList(String month,
			String year) {
		String sql = "SELECT * FROM transactions WHERE YEAR(Date) = ? AND MONTH(Date) = ?";
		DBconnect dbconn = new DBconnect();
		Connection conn = dbconn.conn();
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, year);
			pstmt.setString(2, month);
			ResultSet rs = pstmt.executeQuery();
			ArrayList<SalesRepTransactions> List = new ArrayList<SalesRepTransactions>();
			while (rs.next()) {
				SalesRepTransactions transaction = new SalesRepTransactions();
				transaction.setBuyerID(rs.getInt("buyerID") + "");
				transaction.setTotalPrice(rs.getDouble("totalPrice"));
				transaction.setTransactionID(rs.getInt("transactionID") + "");
				List.add(transaction);
			}
			return List;
		} catch (Exception e) {
			System.out.println(e);
			return null;
		}
	}
}
