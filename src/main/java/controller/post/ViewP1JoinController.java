package controller.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.UserManager;
import model.Pet;
import model.UserInfo;

public class ViewP1JoinController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	HttpSession session = request.getSession();

    	System.out.println("loginId : "+ session.getAttribute("loginId"));
    	
    	if (!UserSessionUtils.hasLogined(session)) {
            return "/user/loginForm.jsp";		
        }
    	
		UserManager manager = UserManager.getInstance();
		int userId= Integer.parseInt(request.getParameter("userId"));
		
    	UserInfo user = null;
		user = manager.findUser(userId);	
		
		Pet pet = null;
		pet = manager.findPet(user.getLoginId());
		
		request.setAttribute("user", user);	
		request.setAttribute("pet", pet);
		return "/community/group_community/group_member_info.jsp";				
    }
}
