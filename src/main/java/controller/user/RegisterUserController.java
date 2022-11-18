package controller.user;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.UserInfo;
import model.service.ExistingUserException;
import model.service.UserManager;

public class RegisterUserController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(RegisterUserController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
       	if (request.getMethod().equals("GET")) {	
       		// GET request: 회원정보 등록 form 요청	
    		log.debug("RegisterForm Request");
    		System.out.println("여기1");
			return "/user/registerForm.jsp";   //  registerForm���� ����     	
	    }	

     // POST request (회원정보가 parameter로 전송됨)
       	log.debug("befor Create User : {}");
       	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
       	String phoneNumber = request.getParameter("phone1")+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
       	ArrayList<Integer> list = new ArrayList<>();
       	list.add(Integer.parseInt(request.getParameter("petList")));
       	
       	
       	UserInfo user = new UserInfo(
			request.getParameter("loginId"),
			request.getParameter("loginPwd"),
			request.getParameter("userNickname"),
			formatter.parse(request.getParameter("userBirth")),
			phoneNumber,
			request.getParameter("gender"),
			request.getParameter("address"),
			(ArrayList)(request.getAttribute("petList"))
			);
		
        log.debug("Create User : {}", user);

		try {
			UserManager manager = UserManager.getInstance();
			manager.create(user);
	        return "redirect:/user/login/form";	// ���� �� ����� ����Ʈ ȭ������ redirect
	        
		} catch (ExistingUserException e) {	// ���� �߻� �� ȸ������ form���� forwarding
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("user", user);
			
			return "/user/registerForm.jsp";
		}
    }
    
    public static ArrayList<Integer> stringToArrayList(String input){
        String[] s = input.split(",");
        ArrayList<Integer> list = new ArrayList<>();
        for(int a = 0; a<s.length; a++) {
           list.add(Integer.parseInt(s[a]));
        }
        return list;
     }

}

