package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.UserManager;
import model.PostAdoption;
import model.UserInfo;

public class ViewP3Controller implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	// �α��� ���� Ȯ��
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/";		// login form ��û���� redirect(get)
        }
    	
		UserManager manager = UserManager.getInstance();
		int postId = Integer.parseInt(request.getParameter("postId"));
		
    	PostAdoption pA = null;
		pA = manager.findP3Adoption(postId);	// ����� ���� �˻�	
		
		request.setAttribute("pA", pA);		// ����� ���� ����				
		return "/user/view.jsp";				// ����� ���� ȭ������ �̵�
    }
}
