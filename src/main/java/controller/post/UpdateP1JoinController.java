package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.UserManager;
import model.PostGroup;

public class UpdateP1JoinController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	HttpSession session = request.getSession();
    	String loginId = (String) session.getAttribute("loginId");
    	System.out.println("loginId : "+ loginId);
    	
    	if (!UserSessionUtils.hasLogined(session)) {
            return "/user/loginForm.jsp";		
        }
    	
		UserManager manager = UserManager.getInstance();
		int postId= Integer.parseInt(request.getParameter("postId"));
		int headCount=Integer.parseInt(request.getParameter("headCount"));
		System.out.println("postId "+postId);
		manager.joinPostGroup(headCount+1, postId);
		
		PostGroup post = null;
		post = manager.findP1Group(postId);	
		request.setAttribute("post", post);	
		request.setAttribute("headCount", post.getHeadCount());					
		return "/community/group_community/group_content.jsp";				
    }
}
