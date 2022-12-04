package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.UserManager;
import model.PostAdoption;
import model.PostInformation;
import model.UserInfo;

public class ViewP3Controller implements Controller {
	private static final Logger log = LoggerFactory.getLogger(PostAdoption.class);
    
	
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
    		System.out.println("여기?");
            //return "redirect:/user/login/";		// login form ��û���� redirect(get)
    		return "/user/loginForm.jsp"; 
    	}
    	log.debug("여긴 p3 controller : {}");
		UserManager manager = UserManager.getInstance();
		int postId = Integer.parseInt(request.getParameter("postId"));
		
    	PostAdoption pA = null;
		pA = manager.findP3Adoption(postId);	// ����� ���� �˻�	
		log.debug("findP3 : {}", pA);
		request.setAttribute("pA", pA);		// ����� ���� ����				
		return "/community/adopt_community/adopt_info.jsp";				// ����� ���� ȭ������ �̵�
 	
    }

}
