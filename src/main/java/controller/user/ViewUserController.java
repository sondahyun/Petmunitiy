package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.service.UserManager;
import model.UserInfo;

public class ViewUserController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	// �α��� ���� Ȯ��
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";		// login form ��û���� redirect
        }
    	
		UserManager manager = UserManager.getInstance();
		String userId = request.getParameter("userId");
		
    	UserInfo user = null;
		user = manager.findUser(userId);	// ����� ���� �˻�	
		request.setAttribute("user", user);		// ����� ���� ����				
		return "/user/view.jsp";				// ����� ���� ȭ������ �̵�
    }
}
