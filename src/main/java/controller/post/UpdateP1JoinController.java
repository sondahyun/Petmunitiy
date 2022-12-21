package controller.post;
import java.util.List;

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
		
		int userId = UserSessionUtils.getLoginUserId(session);
		int postId= Integer.parseInt(request.getParameter("postId"));
		int headCount=Integer.parseInt(request.getParameter("headCount"));
		String postTitle=request.getParameter("postTitle");
		
		manager.joinPostGroup(headCount+1, postId);
		manager.updateJoinGroup(postTitle, userId);
		List<Integer> joinUser = manager.findUserWithGroup(postTitle);
		
		PostGroup post = null;
		post = manager.findP1Group(postId);	
		request.setAttribute("post", post);	
		request.setAttribute("headCount", post.getHeadCount());	
		request.setAttribute("joinUser", joinUser);
		return "/community/group_community/group_content.jsp";				
    }
}
