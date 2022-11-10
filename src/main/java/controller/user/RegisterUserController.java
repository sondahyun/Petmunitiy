package controller.user;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.UserList;
import model.service.ExistingUserException;
import model.service.UserManager;

public class RegisterUserController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(RegisterUserController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
       	/*if (request.getMethod().equals("GET")) {	
    		// GET request: 회원정보 등록 form 요청	
    		log.debug("RegisterForm Request");
		
			return "/user/registerForm.jsp";   //  registerForm으로 전송     	
	    }	*/

    	// POST request (회원정보가 parameter로 전송됨)
       	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
       	UserList user = new UserList(
       		Integer.parseInt(request.getParameter("userId")),
			request.getParameter("loginId"),
			request.getParameter("loginPwd"),
			request.getParameter("userNickname"),
			formatter.parse(request.getParameter("userBirth")),
			request.getParameter("phoneNumber"),
			request.getParameter("gender"),
			request.getParameter("address"),
			Integer.parseInt(request.getParameter("petList"))
			);
		
        log.debug("Create User : {}", user);

		try {
			UserManager manager = UserManager.getInstance();
			manager.create(user);
	        return "redirect:/user/list";	// 성공 시 사용자 리스트 화면으로 redirect
	        
		} catch (ExistingUserException e) {	// 예외 발생 시 회원가입 form으로 forwarding
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("user", user);
			return "/user/registerForm.jsp";
		}
    }
}

