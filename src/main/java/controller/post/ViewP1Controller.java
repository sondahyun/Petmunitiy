package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.UserManager;
import model.PostGroup;

public class ViewP1Controller implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	HttpSession session = request.getSession();

    	System.out.println("loginId : "+ session.getAttribute("loginId"));
    	
    	if (!UserSessionUtils.hasLogined(session)) {
            return "/user/loginForm.jsp";		
        }
    	
		UserManager manager = UserManager.getInstance();
		int postId=-1;
		if(request.getParameter("postId")!=null)
	         postId = Integer.parseInt(request.getParameter("postId"));
	      else
	         postId = Integer.parseInt((String) session.getAttribute("postId"));

		System.out.println("postId "+postId);
		
    	PostGroup post = null;
		post = manager.findP1Group(postId);	
		request.setAttribute("post", post);					
		return "/community/group_community/group_content.jsp";				
    }
}
