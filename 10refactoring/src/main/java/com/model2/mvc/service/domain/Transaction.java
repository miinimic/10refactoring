package com.model2.mvc.service.domain;

public class Transaction {
	
	private int purNo;
	private int tranNo;
	private int prodNo;
	private String buyerId;

	public Transaction(){
	}
	public int getPurNo() {
		return purNo;
	}
	public void setPurNo(int purNo) {
		this.purNo = purNo;
	}
	public int getTranNo() {
		return tranNo;
	}
	public void setTranNo(int tranNo) {
		this.tranNo = tranNo;
	}
	public int getProdNo() {
		return prodNo;
	}
	public void setProdNo(int prodNo) {
		this.prodNo = prodNo;
	}
	public String getBuyerId() {
		return buyerId;
	}
	public void setBuyerId(String buyerId) {
		this.buyerId = buyerId;
	}
	@Override
	public String toString() {
		return "TransactionVO : [purNo]" + purNo
				+ "[tranNo]" + tranNo+ "[prodNo]" + prodNo + "[buyerId]" + buyerId;
	}	
}