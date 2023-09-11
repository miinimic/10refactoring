package com.model2.mvc.web.user;

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
import com.model2.mvc.service.domain.User;
import com.model2.mvc.service.user.UserService;


//==> ȸ������ RestController
@RestController
@RequestMapping("/user/*")
public class UserRestController {
	
	///Field
	@Autowired
	@Qualifier("userServiceImpl")
	private UserService userService;
	//setter Method ���� ����
	
	@Value("#{commonProperties['pageUnit']}")
	int pageUnit;
	@Value("#{commonProperties['pageSize']}")
	int pageSize;
		
	public UserRestController(){
		System.out.println(this.getClass());
	}
	
	@RequestMapping( value="json/getUser/{userId}", method=RequestMethod.GET )
	public User getUser( @PathVariable String userId ) throws Exception{
		
		System.out.println("/user/json/getUser : GET");
		
		//Business Logic
		return userService.getUser(userId);
	}

	@RequestMapping( value="json/login", method=RequestMethod.POST )
	public User login(	@RequestBody User user,
									HttpSession session ) throws Exception{
	
		System.out.println("/user/json/login : POST");
		//Business Logic
		System.out.println("::"+user);
		User dbUser=userService.getUser(user.getUserId());
		
		if( user.getPassword().equals(dbUser.getPassword())){
			session.setAttribute("user", dbUser);
		}
		
		return dbUser;
	}
	
	@RequestMapping( value="json/addUser", method=RequestMethod.POST )
	public User addUser( @RequestBody User user ) throws Exception {

		System.out.println("/user/json/addUser : POST");
		//Business Logic
		userService.addUser(user);
		
		User dbUser=userService.getUser(user.getUserId());
		
		return dbUser;
	}
	
	@RequestMapping( value="json/checkDuplication", method=RequestMethod.POST )
	public boolean checkDuplication( @RequestBody User user) throws Exception{
		System.out.println("/user/json/checkDuplication : POST");
		//Business Logic
		String userId = user.getUserId();
		boolean result=userService.checkDuplication(userId);

		System.out.println(result + " : result");
		System.out.println(userId + " : userId");

		return result;
	}
	
	@RequestMapping( value="json/updateUser/{userId}", method=RequestMethod.GET )
	public User updateUser( @PathVariable String userId ) throws Exception{

		System.out.println("/json/user/updateUser : GET");
		//Business Logic
		User user = userService.getUser(userId);
		// Model �� View ����
		
		return user;
	}

	@RequestMapping( value="json/updateUser", method=RequestMethod.POST )
	public User updateUser( @RequestBody User user , HttpSession session) throws Exception{

		System.out.println("/json/user/updateUser : POST");
		//Business Logic
		userService.updateUser(user);
		User result = userService.getUser(user.getUserId());
		
		/*String sessionId=((User)session.getAttribute("user")).getUserId();
		if(sessionId.equals(user.getUserId())){
			session.setAttribute("user", user);
		}*/
		
		return result;
	}
	
	@RequestMapping( value="json/listUser/{currentPage}" )
	public Map<String , Object> listUser(  @PathVariable int currentPage) throws Exception{	
		System.out.println("/json/user/listUser : GET / POST");
		
		System.out.println("currentPage : "+currentPage);
		
		Search search = new Search();
		
			if(currentPage ==0 ){
				search.setCurrentPage(1);
			} else {
				search.setCurrentPage(currentPage);				
			}
			search.setPageSize(pageSize);
		
		// Business logic ����
		Map<String , Object> map=userService.getUserList(search);
		
		Page resultPage = new Page( search.getCurrentPage(), ((Integer)map.get("totalCount")).intValue(), pageUnit, pageSize);
		System.out.println("resultPage : "+resultPage);
		
		return map;
	}
}