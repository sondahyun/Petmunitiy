package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.pet.RegisterPetController;
import model.service.UserManager;

public class LoginController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(LoginController.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	if (request.getMethod().equals("GET")) {	
       		// GET request: 회원정보 등록 form 요청	
    		log.debug("LoginController Request");
    		//System.out.println("여기1");
			return "redirect:/user/login/form";   //  registerForm���� ����     	
	    }	
    	String loginId = request.getParameter("loginId");
		String loginPwd = request.getParameter("password");
		String userId = request.getParameter("userId");
		
		try {
			// �𵨿� �α��� ó���� ����
			UserManager manager = UserManager.getInstance();
			manager.login(loginId, loginPwd);
	
			// ���ǿ� ����� ���̵� ����
			HttpSession session = request.getSession();
            session.setAttribute("loginId", loginId);
            session.setAttribute(UserSessionUtils.USER_SESSION_KEY, userId);
            
            return "redirect:/";			
		} catch (Exception e) {
			/* UserNotFoundException�̳� PasswordMismatchException �߻� ��
			 * �ٽ� login form�� ����ڿ��� �����ϰ� ���� �޼����� ���
			 */
			System.out.println("로그인실패");
            request.setAttribute("loginFailed", true);
			request.setAttribute("exception", e);
            return "/user/loginForm.jsp";			
		}	
    }
}
