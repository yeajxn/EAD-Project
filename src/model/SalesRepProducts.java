package model;

public class SalesRepProducts {
	private String productID;
	private double unitPrice;
	private int quantity;
	public SalesRepProducts(String productID, double unitPrice, int quantity) {
		super();
		this.productID = productID;
		this.unitPrice = unitPrice;
		this.quantity = quantity;
	}
	public SalesRepProducts() {
		super();
	}

	public String getProductID() {
		return productID;
	}

	public void setProductID(String productID) {
		this.productID = productID;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
