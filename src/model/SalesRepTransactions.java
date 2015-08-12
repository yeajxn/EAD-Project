package model;

public class SalesRepTransactions {
	private String TransactionID;
	private String BuyerID;
	private double totalPrice;

	public SalesRepTransactions(String transactionID, String buyerID,
			double totalPrice) {
		super();
		TransactionID = transactionID;
		BuyerID = buyerID;
		this.totalPrice = totalPrice;
	}

	public SalesRepTransactions() {
		super();
	}

	public String getTransactionID() {
		return TransactionID;
	}

	public void setTransactionID(String transactionID) {
		TransactionID = transactionID;
	}

	public String getBuyerID() {
		return BuyerID;
	}

	public void setBuyerID(String buyerID) {
		BuyerID = buyerID;
	}

	public double getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(double totalPrice) {
		this.totalPrice = totalPrice;
	}
}
