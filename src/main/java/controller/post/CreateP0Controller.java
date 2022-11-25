package controller.post;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.PostInformation;
import model.service.UserManager;

public class CreateP0Controller implements Controller {
    private static final Logger log = LoggerFactory.getLogger(PostInformation.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
       	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    	
       	PostInformation pi = new PostInformation(
    		request.getParameter("postTitle"),
			request.getParameter("post"),
			formatter.parse(request.getParameter("postDate")),
			request.getParameter("postContent"),
			request.getParameter("fileName")
			null, null, null);		
        
		try {
			UserManager manager = UserManager.getInstance();
			manager.createCommunity(comm);
			
	    	log.debug("Create Community : {}", comm);
	        return "redirect:/community/list";	// 성공 시 커뮤니티 리스트 화면으로 redirect
	        
		} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
            request.setAttribute("creationFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("comm", comm);
			return "/community/creationForm.jsp";
		}
    }
}
