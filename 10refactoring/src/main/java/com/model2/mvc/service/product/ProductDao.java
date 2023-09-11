package com.model2.mvc.service.product;

import java.util.Map;
import java.util.List;

import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;

public interface ProductDao {
	
	//admin�� �Ǹ����� ��ǰ delete
	public void deleteProduct(int ProdNo) throws Exception;
	
	public void deleteCart(int ProdNo, String userId) throws Exception;

	//admin�� ��ǰ ���
	public void insertProduct(Product product) throws Exception;
	
	//user�� ��ٱ��Ͽ� ��ǰ insert
	public void addCart(int prodNo, String userId) throws Exception;
	
	//cart_no select
	public int getCartNo(int prodNo) throws Exception;
		
	//getProductList
	public List<Product> getProductList(Search search) throws Exception;
	
	public List<Product> getSaleList(Search search) throws Exception;


	//product, transaction�� tran_status_code ��ȸ
	public Product findProduct(int prodNo) throws Exception;

	//��ǰ ����(admin)
	public void updateProduct(Product product) throws Exception;
	
	// �Խ��� Page ó���� ���� ��üRow(totalCount)  return
	public int getTotalCount(Search search) throws Exception;
	
	public int getTotalCountSale(Search search) throws Exception;
	
}