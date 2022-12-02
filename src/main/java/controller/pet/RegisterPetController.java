package controller.pet;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.Pet;
import model.UserInfo;
import model.service.ExistingUserException;
import model.service.UserManager;

public class RegisterPetController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(RegisterPetController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
       	if (request.getMethod().equals("GET")) {	
       		// GET request: 회원정보 등록 form 요청	
    		log.debug("RegisterPetForm Request");
    		//System.out.println("여기1");
			return "/user/registerForm.jsp";   //  registerForm���� ����     	
	    }	

     // POST request (회원정보가 parameter로 전송됨)
       	log.debug("befor Create Pet : {}");
    	HttpSession session = request.getSession();
    	Object loginId = session.getAttribute("loginId");
       	
       	Pet pet = new Pet(
			request.getParameter("name"),
			request.getParameter("gender"),
			Integer.parseInt(request.getParameter("age")),
			request.getParameter("health"),
			request.getParameter("vaccination"),
			request.getParameter("kind"),
			request.getParameter("filename"),
			String.valueOf(loginId)
			);
		//user.setUserId(1);
		
        log.debug("Create User : {}", pet);

		try {
			UserManager manager = UserManager.getInstance();
			manager.create(pet);
	        return "redirect:/user/login/form";	// ���� �� ����� ����Ʈ ȭ������ redirect
	        
		} catch (ExistingUserException e) {	// ���� �߻� �� ȸ������ form���� forwarding
            request.setAttribute("registerFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("pet", pet);
			
			return "/user/registerForm.jsp";
		}
    }
    
	/*
	 * public static ArrayList<Integer> stringToArrayList(String input){ String[] s
	 * = input.split(","); ArrayList<Integer> list = new ArrayList<>(); for(int a =
	 * 0; a<s.length; a++) { list.add(Integer.parseInt(s[a])); } return list; }
	 */
}

