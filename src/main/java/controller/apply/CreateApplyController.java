package controller.apply;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.PostInformation;
import model.service.UserManager;

public class CreateApplyController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(PostInformation.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	HttpSession session = request.getSession();
    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
       	Object loginId = session.getAttribute("loginId");
    	
		PostInformation pi = new PostInformation(
    		request.getParameter("postTitle"),
			formatter.parse(request.getParameter("postDate")),
			request.getParameter("postContent"),
			request.getParameter("fileName"),
			request.getParameter("kind"),
			String.valueOf(loginId)
			);		
        
		try {
			UserManager manager = UserManager.getInstance();
			manager.createPostInformation(pi);
			
	    	log.debug("Create PostInformation : {}", pi);
	        return "redirect:/community/info_community";	// 성공 시 커뮤니티 리스트 화면으로 redirect
	        
		} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
            request.setAttribute("creationFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("pi", pi);
			return "/community/creationForm.jsp";
		}
    }
}
