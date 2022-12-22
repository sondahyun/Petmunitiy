package controller.post;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.*;
import model.service.UserManager;

public class MainController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
    	UserManager manager = UserManager.getInstance();
		List<PostInformation> p0List = manager.findP0List();
		List<PostPetstargram> p2List = manager.findP2List();
		List<PostAdoption> p3List = manager.findP3List();
		request.setAttribute("p0List", p0List);			
		request.setAttribute("p2List", p2List);				
		request.setAttribute("p3List", p3List);		
		
		
		return "/main/main.jsp";        
    }
}
