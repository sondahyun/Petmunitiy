package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.UserManager;
import model.PostInformation;

public class ViewP0Controller implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/";		
        }
    	
		UserManager manager = UserManager.getInstance();
		int postId = Integer.parseInt(request.getParameter("postId"));
		
		System.out.println("postId "+postId);
		
    	PostInformation post = null;
		post = manager.findP0Information(postId);	
		request.setAttribute("post", post);					
		return "/community/info_community/info_content.jsp";				
    }
}
