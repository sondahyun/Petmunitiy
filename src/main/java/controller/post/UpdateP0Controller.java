package controller.post;

import java.text.SimpleDateFormat;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import controller.Controller;
import model.PostInformation;
import model.service.UserManager;

public class UpdateP0Controller implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdateP0Controller.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
 
		int postId = Integer.parseInt(request.getParameter("postId"));
		
		if (request.getMethod().equals("GET")) {	
    		// GET request: 커뮤니티 수정 form 요청	
    		UserManager manager = UserManager.getInstance();
			PostInformation post0 = manager.findInformationPost(postId);
			request.setAttribute("post0", post0);			
				
			return "/community/updateForm.jsp";   // 검색한 정보를 update form으로 전송     
	    }	
		
		// POST request (커뮤니티 정보가 parameter로 전송됨)
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
		
    	log.debug("Update Community : {}", pi);

		UserManager manager = UserManager.getInstance();
		manager.updatePostInformation(pi);			
        return "redirect:/community/info_community";			
    }
}
