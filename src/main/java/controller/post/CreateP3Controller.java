package controller.post;

import java.text.SimpleDateFormat;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.PostAdoption;
import model.service.UserManager;

public class CreateP3Controller implements Controller {
    private static final Logger log = LoggerFactory.getLogger(PostAdoption.class);
    HttpSession session;
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
       	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
       	Object loginId = session.getAttribute("loginId");
    	session = request.getSession();
       	
		PostAdoption pA = new PostAdoption(
    		request.getParameter("postTitle"),
			formatter.parse(request.getParameter("postDate")),
			Integer.parseInt(request.getParameter("type")),
			Integer.parseInt(request.getParameter("approval")),
			formatter.parse(request.getParameter("approvalDate")),
			request.getParameter("postContent"),
			String.valueOf(loginId)
			);		
        
		try {
			UserManager manager = UserManager.getInstance();
			manager.createP3Adoption(pA);
			
	    	log.debug("Create PostAdoption : {}", pA);
	        return "redirect:/community/adopt_community";	// 성공 시 커뮤니티 리스트 화면으로 redirect
	        
		} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
            request.setAttribute("creationFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("pA", pA);
			return "/community/creationP3Form.jsp";
		}
    }
}
