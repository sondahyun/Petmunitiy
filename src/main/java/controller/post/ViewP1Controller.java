package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.UserManager;
import model.PostGroup;

public class ViewP1Controller implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	System.out.println("loginId : "+request.getSession().getAttribute("loginId"));
    	
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "/user/loginForm.jsp";		
        }
    	
		UserManager manager = UserManager.getInstance();
		int postId = Integer.parseInt(request.getParameter("postId"));
		
		System.out.println("postId "+postId);
		
    	PostGroup post = null;
		post = manager.findP1Group(postId);	
		request.setAttribute("post", post);					
		return "/community/group_community/group_content.jsp";				
    }
}
