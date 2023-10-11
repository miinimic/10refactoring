package com.model2.mvc.web.product;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.domain.Purchase;
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.product.ProductService;


@RestController
@RequestMapping("/product/*")
public class ProductRestController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method 구현 않음
		
	public ProductRestController(){
		System.out.println(this.getClass());
	}
	
	/*@RequestMapping(value="json/listProductAsc/{order}", method=RequestMethod.GET)
	public Map<String , Object> listProductAsc(@PathVariable String order) throws Exception{
		
		System.out.println("/json/listProductAsc");
		
		Search search = new Search();
		
		search.setOrder(order);
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		} 

		search.setPageSize(8);
		
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);	

		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), 5, 8);
		System.out.println(resultPage);
		
		return map;
	}*/
	
	
	@RequestMapping("json/listProduct")
	public Map<String , Object> listProduct( @RequestBody Search search  , HttpServletRequest request) throws Exception{
		
		System.out.println("/json/listProduct");
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		} 

		search.setPageSize(8);
		
		
		// Business logic 수행
		Map<String , Object> map=productService.getProductList(search);	

		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), 5, 8);
		System.out.println(resultPage);
		
		return map;
	}
	
	@RequestMapping(value="json/addProduct", method=RequestMethod.POST)
	public Product addProduct(@RequestBody Product product, HttpServletRequest request) throws Exception {

		System.out.println("json/addProduct");

		productService.insertProduct(product);
				
		return product;
	}
	
	@RequestMapping(value="json/deleteProduct/{prodNo}", method=RequestMethod.GET)
	//public String deleteProduct(@RequestBody Product product , @RequestBody Search search, HttpSession session) throws Exception{
	public String deleteProduct(@PathVariable int prodNo) throws Exception{
		System.out.println("/json/deleteProduct");
		//Business Logic
		
		/*if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		}*/ 
		
		productService.deleteProduct(prodNo);

		return "true";
	}
	
	@RequestMapping("json/getProduct/{prodNo}")
	public Product getProduct(@PathVariable int prodNo ) throws Exception{
		
		System.out.println("/product/json/getProduct : GET");
		
		//Business Logic
		return productService.findProduct(prodNo);
	}
	
	@RequestMapping( value="json/addCart/{prodNo}/{userId}", method=RequestMethod.GET )
	public String addCart(@PathVariable int prodNo, @PathVariable String userId) throws Exception {

		System.out.println("/json/addCart");
		
		int prodNo2 = prodNo;
		String userId2 = userId;
		
		System.out.println(prodNo+": prodNo2");
		System.out.println(userId+" : userId2");
		
		productService.addCart(prodNo2, userId2);
	
		return "true";
	}
	
	@RequestMapping(value="json/deleteCart/{prodNo}/{userId}", method=RequestMethod.GET)
	public String deleteCart( @PathVariable int prodNo, @PathVariable String userId) throws Exception{
	//	public String deleteCart( @PathVariable int prodNo, @RequestBody Search search, Model model , HttpSession session) throws Exception{
		System.out.println("json/deleteCart");
		//Business Logic
		
		/*if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		} */
		int prodNo2 = prodNo;
		String userId2 = userId;
		
		System.out.println("prodNo : "+prodNo2);
		System.out.println("userId : "+userId2);
		
		productService.deleteCart(prodNo2, userId2);
		
		return "true";
	
	}
	
	@RequestMapping( value="json/updateProduct/{prodNo}", method=RequestMethod.GET )
	public Product updateProduct( @PathVariable int prodNo  ) throws Exception{

		System.out.println("/json/updateProduct : GET");
		//Business Logic
		Product product = productService.findProduct(prodNo);

		return product;
	}
	
	@RequestMapping( value="json/updateProduct", method=RequestMethod.POST )
	public Product updateProduct( @RequestBody Product product, HttpSession session) throws Exception{

		System.out.println("/json/updateProduct : POST");
		//Business Logic

		productService.updateProduct(product);
		Product result = productService.findProduct(product.getProdNo());
		
		//return "redirect:/product/getProduct?prodNo="+product.getProdNo()+"&menu=manage";
		return result;
	}
	@RequestMapping( value="json/listProductAuto/{searchCondition}/{searchKeyword}" )
	public List<Product> listProductAuto(@PathVariable String searchCondition, @PathVariable String searchKeyword) throws Exception{	
		System.out.println("/json/user/listProductAuto : GET / POST");

		Search search = new Search();
		search.setSearchCondition(searchCondition);
		search.setSearchKeyword(searchKeyword);
		
		System.out.println("search.getSearchCondition() : "+search.getSearchCondition());
		
		System.out.println("search.getSearchKeyword() : "+search.getSearchKeyword());
		
		// Business logic 수행
		//Map<String , Object> map=userService.getUserList(search);
		List<Product> result =productService.getProductAutoList(search);

		
		return result;
	}

}