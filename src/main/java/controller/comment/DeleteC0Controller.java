package controller.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.UserManager;

public class DeleteC0Controller implements Controller {
    private static final Logger log = LoggerFactory.getLogger(DeleteC0Controller.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
    	System.out.println("c0");
    	int commentId = Integer.parseInt(request.getParameter("commentId"));
    	log.debug("Delete c0_Id : {}", commentId);
    	
		UserManager manager = UserManager.getInstance();			
		manager.removeC0(commentId);
		
		HttpSession session = request.getSession();
		session.setAttribute("postId", request.getParameter("postId"));
		return "redirect:/community/info_community/info_content";
	}
}
