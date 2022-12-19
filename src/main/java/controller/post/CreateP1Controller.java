package controller.post;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.Apply;
import model.PostGroup;
import model.PostInformation;
import model.service.UserManager;

public class CreateP1Controller implements Controller {
    private static final Logger log = LoggerFactory.getLogger(Apply.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	/*if (request.getMethod().equals("GET")) {	
       		// GET request: 회원정보 등록 form 요청	
    		log.debug("group_community add");
    		//System.out.println("여기1");
			return "/community/info_community/add_content.jsp";   //  registerForm���� ����     	
	    }
    	
    	HttpSession session = request.getSession();
       	Object loginId = session.getAttribute("loginId");
    	
		PostGroup pg = new PostGroup(
    		request.getParameter("postTitle"),
			request.getParameter("postContent"),
			request.getParameter("fileName"),
			request.getParameter("kind"),
			String.valueOf(loginId)
			);		
        
		try {
			UserManager manager = UserManager.getInstance();
			manager.createPostInformation(pi);
			
	    	log.debug("Create PostInformation : {}", pi);
	        return "redirect:/community/info_community/info_community";	// 성공 시 커뮤니티 리스트 화면으로 redirect
	        
		} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
            request.setAttribute("creationFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("pi", pi);
			return "/community/info_community/info_community.jsp";
		}*/
    	return null;
    }
}
