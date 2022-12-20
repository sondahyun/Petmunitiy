package controller.post;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.PostPetstargram;
import model.service.UserManager;

public class ListP2Controller implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
    	UserManager manager = UserManager.getInstance();
    	
		List<PostPetstargram> p2List = manager.findP2List();
		
		request.setAttribute("p2List", p2List);				
		return "/community/petstar_community/petstar_community.jsp";        
    }
}
