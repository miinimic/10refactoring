package com.model2.mvc.service.domain;

public class Transaction {
	
	private int purNo;
	private int tranNo;
	private int prodNo;
	private String userId;
	
	private Product product;
	private User user;
	private Purchase purchase;

	public Transaction(){
	}
	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Purchase getPurchase() {
		return purchase;
	}
	public void setPurchase(Purchase purchase) {
		this.purchase = purchase;
	}
	public int getTranNo() {
		return tranNo;
	}
	public int getProdNo() {
		return prodNo;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}	

	@Override
	public String toString() {
		return "TransactionVO : [purNo]" + purNo +"[tranNo]" + tranNo + "[prodNo]" + prodNo + "[userId]"+userId
				+ "[product]" + product+ "[user]" + user + "[purchase]" + purchase;
	}

}