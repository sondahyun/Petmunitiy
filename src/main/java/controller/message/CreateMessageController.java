package controller.message;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Message;
import model.UserInfo;
import model.service.ExistingUserException;
import model.service.UserManager;

public class CreateMessageController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(CreateMessageController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
       	if (request.getMethod().equals("GET")) {	
       		// GET request: 회원정보 등록 form 요청	
    		log.debug("CreateMessageForm Request");
    		//System.out.println("여기1");
			return "/message/message_write.jsp";   //  registerForm���� ����     	
	    }	

    	HttpSession session = request.getSession();
		UserManager manager = UserManager.getInstance();

    	int userId = UserSessionUtils.getLoginUserId(session);
    	String userNickname=request.getParameter("userNickname");
    	int receiver = manager.findUserIdWithNickName(userNickname);
    	
       	Message message = new Message(
			userId,
			receiver,
			request.getParameter("content"),
			request.getParameter("mTitle")
		);
		//user.setUserId(1);
		
        log.debug("Create Message : {}", message);

		try {
			manager.createMessage(message);
	        return "redirect:/message/message";	// ���� �� ����� ����Ʈ ȭ������ redirect
	        
		} catch (Exception e) {	// ���� �߻� �� ȸ������ form���� forwarding
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("message", message);
			
			return "/message/message_write.jsp";
		}
    }
}

