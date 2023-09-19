package com.model2.mvc.web.product;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Cookie;

import org.apache.commons.fileupload.DiskFileUpload;
import org.apache.commons.fileupload.FileUpload;
import org.apache.commons.fileupload.FileItem
;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.model2.mvc.common.Page;
import com.model2.mvc.common.Search;
import com.model2.mvc.service.domain.Product;
import com.model2.mvc.service.product.ProductService;

import oracle.net.aso.e;


//==> ȸ������ Controller
@Controller
@RequestMapping("/product/*")
public class ProductController {
	
	///Field
	@Autowired
	@Qualifier("productServiceImpl")
	private ProductService productService;
	//setter Method ���� ����
		
	public ProductController(){
		System.out.println(this.getClass());
	}
	
	//==> classpath:config/common.properties  ,  classpath:config/commonservice.xml ���� �Ұ�
	//==> �Ʒ��� �ΰ��� �ּ��� Ǯ�� �ǹ̸� Ȯ�� �Ұ�
	@Value("#{commonProperties['pageUnit']}")
	//@Value("#{commonProperties['pageUnit'] ?: 3}")
	int pageUnit;
	
	@Value("#{commonProperties['pageSize']}")
	//@Value("#{commonProperties['pageSize'] ?: 2}")
	int pageSize;
	
	
	//@RequestMapping("/addProduct")
	@RequestMapping( value="addProduct", method=RequestMethod.POST)
	public String addProduct(@ModelAttribute("product") Product product, @RequestParam("file") MultipartFile[] file, Model model) throws Exception {
		//DiskFileUpload�� ����Ͽ� ���� ���ε带 �������� ó���ϴ� ��ſ�, �������� MultipartFile�� ����Ͽ� ���� ���ε带 ó���մϴ�. 
		//common-servlet.xml���� CommonsMultipartResolver �� ����
		System.out.println("/addProduct");

		System.out.println("product : "+product);
		
		List<String> uploadedFileNames = new ArrayList<>();
		
		String fileNames = "";

		for (MultipartFile files : file) {
		    if (!files.isEmpty()) {
		        String temDir = "C:\\Users\\��Ʈķ��\\git\\10refactoring\\10refactoring\\src\\main\\webapp\\images";
		        File uploadDir = new File(temDir);

		        if (!uploadDir.exists()) {
		            uploadDir.mkdirs();
		        }

		        String originalFileName = files.getOriginalFilename();
		        String fileName = new String(originalFileName.getBytes("UTF-8"), "UTF-8");

		        System.out.println("fileName : " + fileName);
		        fileNames += fileName + ",";

		        if (files.getSize() <= 1024 * 1024 * 10) {
		            File uploadedFile = new File(uploadDir, fileName);
		            files.transferTo(uploadedFile);

		            // �� �ʵ忡�� �ٸ� �Ӽ� ����
		            uploadedFileNames.add(fileName);
		        } else {
		            int overSize = (int) (files.getSize() / 1000000);
		            System.out.println("<script>alert('������ ũ��� 1MB���� �Դϴ�. �ø��� ���� �뷮��" + overSize + "MB�Դϴ�');");
		            System.out.println("history.back();</script>");
		        }
		    } else {
		        product.setFileName(null);
		    }
		}

		  
		     if (fileNames.endsWith(",")) {
		    	 	fileNames = fileNames.substring(0, fileNames.length() - 1);
		     	}
		  System.out.println("fileNames : "+fileNames);
		  
		  product.setFileName(fileNames);
		  productService.insertProduct(product);

		  model.addAttribute("product", product);
		  model.addAttribute("uploadedFileNames", uploadedFileNames);

	        return "forward:/product/addProduct.jsp";
		
		/*productService.insertProduct(product); // ���Ͼ��ε� �߰��ϱ� ��
		return "forward:/product/addProduct.jsp";*/
		
		/*Product product02 = new Product(); // ���� ���ε� �߰�
		
		if(FileUpload.isMultipartContent(request)) {
			
			String temDir = "C:\\Users\\��Ʈķ��\\git\\08refactoring\\08.Model2MVCShop(RestFul Server)\\src\\main\\webapp\\images";
			
			DiskFileUpload fileUpload = new DiskFileUpload();
			fileUpload.setRepositoryPath(temDir);
			fileUpload.setSizeMax(1024*1024*10);
			fileUpload.setSizeThreshold(1024*100);
	
			if(request.getContentLength() < fileUpload.getSizeMax()) {
							
				StringTokenizer token=null;
				
				List fileItemList = fileUpload.parseRequest(request);
				int Size = fileItemList.size();
				for(int i=0; i<Size;i++) {
					FileItem fileItem = (FileItem)fileItemList.get(i);
					
					if(fileItem.isFormField()) {
						if(fileItem.getFieldName().equals("manuDate")) {
							token=new StringTokenizer(fileItem.getString("euc-kr"), "-");
							String manuDate = token.nextToken()+token.nextToken() + token.nextToken();
							product02.setManuDate(manuDate);
						}
						else if(fileItem.getFieldName().equals("prodName")) product02.setProdName(fileItem.getString("euc-kr"));
						else if(fileItem.getFieldName().equals("prodDetail")) product02.setProdDetail(fileItem.getString("euc-kr"));
						else if(fileItem.getFieldName().equals("price")) product02.setPrice(Integer.parseInt(fileItem.getString("euc-kr")));
						else if(fileItem.getFieldName().equals("item")) product02.setItem(Integer.parseInt(fileItem.getString("euc-kr")));
						else if(fileItem.getFieldName().equals("category")) product02.setCategory(fileItem.getString("euc-kr"));
					} else {
						if(fileItem.getSize() > 0) {
							int idx = fileItem.getName().lastIndexOf("\\");
							
							if(idx== -1) {
								idx=fileItem.getName().lastIndexOf("/");
							}
							String fileName = fileItem.getName().substring(idx + 1);
							product02.setFileName(fileName);
							try {
								File uploadedFile = new File(temDir, fileName);
								fileItem.write(uploadedFile);
							} catch (IOException e) {
								System.out.println(e);
							}
						} else {
							product02.setFileName("../../images/empty.GIF");
						}
					}
				}
				
				productService.insertProduct(product02);

			} else {
				int overSize = (request.getContentLength() / 1000000);
				System.out.println("<script>alert('������ ũ��� 1MB���� �Դϴ�. �ø��� ���� �뷮��"+overSize+"MB�Դϴ�');");
				System.out.println("history.back();</script>");
			}
		} else {
			System.out.println("���ڵ� Ÿ���� multipart/form-data�� �ƴմϴ�");
		}
		
		model.addAttribute("product", product02);
		
		return "forward:/product/addProduct.jsp"; */
	}


	@RequestMapping("/addCart")
	public String addCart(@RequestParam("prodNo") int prodNo, @RequestParam("userId") String userId) throws Exception {

		System.out.println("/addCart");
		productService.addCart(prodNo, userId);

		return "redirect:/product/listProduct?menu=search";
	}
	
	//@RequestMapping("/getProduct")
	@RequestMapping( value="getProduct", method=RequestMethod.GET )
	public String getProduct(@ModelAttribute("search") Search search, @RequestParam("prodNo") int prodNo , Model model ) throws Exception {
		
		System.out.println("/getProduct");
		System.out.println("search : "+search);
		//Business Logic
		Product product = productService.findProduct(prodNo);
		// Model �� View ����
		model.addAttribute("product", product);
		model.addAttribute("search", search);
		
		return "forward:/product/getProduct.jsp";
	}
	
	//@RequestMapping("/updateProductView")
	@RequestMapping( value="updateProductView", method=RequestMethod.GET )
	public String updateProductView( @RequestParam("prodNo") int prodNo , Model model ) throws Exception{

		System.out.println("/updateProductView");
		//Business Logic
		Product product = productService.findProduct(prodNo);
		// Model �� View ����
		model.addAttribute("product", product);
	
		return "forward:/product/updateProductView.jsp";
	}
	
	//@RequestMapping("/updateProduct")
	//@RequestMapping( value="updateProduct", method=RequestMethod.POST )
	//public String updateProduct( @ModelAttribute("product") Product product, Model model , HttpServletRequest request, HttpSession session) throws Exception{

		@RequestMapping(value = "updateProduct", method = RequestMethod.POST)
		public String updateProduct(@ModelAttribute("product") Product product, @RequestParam("file") MultipartFile[] file, Model model, HttpServletRequest request, HttpSession session) throws Exception {
		    System.out.println("/updateProduct");

		    Product product02 = new Product();
		    Product result = new Product();

		    List<String> uploadedFileNames = new ArrayList<>();

		    String fileNames = "";
		    
		    System.out.println("product.getFileName() : "+product.getFileName());

		    // ������ �ϳ��� ó���մϴ�.
		    for (MultipartFile file02 : file) {
		        if (file02 != null && !file02.isEmpty()) {
		            String temDir = "C:\\Users\\��Ʈķ��\\git\\10refactoring\\10refactoring\\src\\main\\webapp\\images";
		            File uploadDir = new File(temDir);
		            if (!uploadDir.exists()) {
		                uploadDir.mkdirs();
		            }

		            String fileName = file02.getOriginalFilename();
		            uploadedFileNames.add(fileName); // ���ε�� ���� �̸��� ����Ʈ�� �߰��մϴ�.

		            if (file02.getSize() <= 1024 * 1024 * 10) {
		                File uploadedFile = new File(uploadDir, fileName);
		                file02.transferTo(uploadedFile);
		            } else {
		                int overSize = (int) (file02.getSize() / 1000000);
		                System.out.println("<script>alert('������ ũ��� 1MB���� �Դϴ�. �ø��� ���� �뷮��" + overSize + "MB�Դϴ�');</script>");
		                return "forward:/product/someErrorPage.jsp";
		            }
		        } else {
		            product02.setFileName(null);
		        }
		    }

		    // ���ε�� ���� �̸����� ��ǥ�� �����Ͽ� �ϳ��� ���ڿ��� ����ϴ�.
		    if (!uploadedFileNames.isEmpty()) {
		        fileNames = String.join(",", uploadedFileNames);
		    }

		    System.out.println("fileNames : " + fileNames);

		    product02.setFileName(fileNames);

		    // �ٸ� ��ǰ �Ӽ� ����
		    product02.setManuDate(product.getManuDate());
		    product02.setProdName(product.getProdName());
		    product02.setProdDetail(product.getProdDetail());
		    product02.setPrice(product.getPrice());
		    product02.setProdNo(product.getProdNo());
		    product02.setCategory(product.getCategory());
		    product02.setItem(product.getItem());

		    productService.updateProduct(product02);
		    result = productService.findProduct(product02.getProdNo());

		    model.addAttribute("product", result);

		    return "redirect:/product/getProduct?prodNo=" + product02.getProdNo() + "&menu=manage";
		


		/*productService.updateProduct(product);		// ���� ���ε� �ϱ� ��
		return "redirect:/product/getProduct?prodNo="+product.getProdNo()+"&menu=manage"; //���� ���ε� ��
		*/
		/*Product product02 = new Product();
		Product result = new Product();

		if(FileUpload.isMultipartContent(request)) {
			
			String temDir = "C:\\Users\\��Ʈķ��\\git\\08refactoring\\08.Model2MVCShop(RestFul Server)\\src\\main\\webapp\\images";
			
			DiskFileUpload fileUpload = new DiskFileUpload();
			fileUpload.setRepositoryPath(temDir);
			fileUpload.setSizeMax(1024*1024*10);
			fileUpload.setSizeThreshold(1024*100);
	
			if(request.getContentLength() < fileUpload.getSizeMax()) {
							
				StringTokenizer token=null;
				
				List fileItemList = fileUpload.parseRequest(request);
				int Size = fileItemList.size();
				for(int i=0; i<Size;i++) {
					FileItem fileItem = (FileItem)fileItemList.get(i);
					
					if(fileItem.isFormField()) {
						if(fileItem.getFieldName().equals("manuDate")) {
							token=new StringTokenizer(fileItem.getString("euc-kr"), "-");
							String manuDate = token.nextToken();
							while(token.hasMoreTokens())
								manuDate+=token.nextToken();
							product02.setManuDate(manuDate);
						} else if(fileItem.getFieldName().equals("prodName")) product02.setProdName(fileItem.getString("euc-kr"));
						else if(fileItem.getFieldName().equals("prodDetail")) product02.setProdDetail(fileItem.getString("euc-kr"));
						else if(fileItem.getFieldName().equals("price")) { product02.setPrice(Integer.parseInt(fileItem.getString("euc-kr")));}
						else if(fileItem.getFieldName().equals("prodNo")) product02.setProdNo(Integer.parseInt(fileItem.getString("euc-kr")));
						else if(fileItem.getFieldName().equals("category")) product02.setCategory(fileItem.getString("euc-kr"));
						else if(fileItem.getFieldName().equals("item")) product02.setItem(Integer.parseInt(fileItem.getString("euc-kr")));
						
				} else {
						if(fileItem.getSize() > 0) {
							int idx = fileItem.getName().lastIndexOf("\\");
							
							if(idx== -1) {
								idx=fileItem.getName().lastIndexOf("/");
							}
							String fileName = fileItem.getName().substring(idx + 1);
							product02.setFileName(fileName);
							try {
								File uploadedFile = new File(temDir, fileName);
								fileItem.write(uploadedFile);
							} catch (IOException e) {
								System.out.println(e);
							}
						} else {
							product02.setFileName("../../images/empty.GIF");
						}
					}
				}
				
				productService.updateProduct(product02);
				result = productService.findProduct(product02.getProdNo());

			} else {
				int overSize = (request.getContentLength() / 1000000);
				System.out.println("<script>alert('������ ũ��� 1MB���� �Դϴ�. �ø��� ���� �뷮��"+overSize+"MB�Դϴ�');");
				System.out.println("history.back();</script>");
			}
		} else {
			System.out.println("���ڵ� Ÿ���� multipart/form-data�� �ƴմϴ�");
		}
		
		model.addAttribute("product", result);
		
		return "redirect:/product/getProduct?prodNo="+product02.getProdNo()+"&menu=manage";*/
	}

	@RequestMapping("/listProduct")
	public String listProduct( @ModelAttribute("search") Search search , Model model , HttpServletRequest request) throws Exception{
		
		System.out.println("/listProduct");
		
		int category=0;
		
		System.out.println("menu : "+search.getMenu());
		if (search.getCategory() != null) {
			System.out.println("category : "+search.getCategory());
			category=productService.getCategoryTotal(search.getCategory());
			System.out.println(category);
		}
		
				
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		} 

		search.setPageSize(pageSize);
		
		
		// Business logic ����
		Map<String , Object> map=productService.getProductList(search);	

		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println(resultPage);
		
		// Model �� View ����
		model.addAttribute("list", map.get("list"));
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("search", search);
		
		if(category != 0) {
		model.addAttribute("category", category);
		}
		return "forward:/product/listProduct.jsp";
	}
	
	@RequestMapping("/deleteProduct")
	public String deleteProduct( @RequestParam("prodNo") int prodNo , @ModelAttribute("search") Search search, Model model , HttpSession session) throws Exception{

		System.out.println("/deleteProduct");
		//Business Logic
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		} 
		
		productService.deleteProduct(prodNo); 

		return "redirect:/product/listProduct?currentPage="+search.getCurrentPage()+"&menu="+search.getMenu();
	}
	
	@RequestMapping("/deleteCart")
	public String deleteCart( @RequestParam("prodNo") int prodNo , @RequestParam("userId") String userId, @ModelAttribute("search") Search search, Model model , HttpSession session) throws Exception{

		System.out.println("/deleteCart");
		//Business Logic
		
		if(search.getCurrentPage() ==0 ){
			search.setCurrentPage(1);
		} 
		
		productService.deleteCart(prodNo, userId); 

		return "redirect:/purchase/listCart?currentPage="+search.getCurrentPage();
	
	}
	
}