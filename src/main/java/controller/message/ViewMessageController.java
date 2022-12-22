package controller.message;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.UserManager;
import model.Message;

public class ViewMessageController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {	
    	HttpSession session = request.getSession();

    	System.out.println("loginId : "+request.getSession().getAttribute("loginId"));
    	
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "/user/loginForm.jsp";		
        }
    	
		UserManager manager = UserManager.getInstance();
		int messageId = Integer.parseInt(request.getParameter("messageId"));
	     
		
    	Message message = null;
		message = manager.findMessage(messageId);	
		request.setAttribute("message", message);
		
		return "/message/message_content.jsp";				
    }
}
