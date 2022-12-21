package controller.comment;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.UserManager;

public class DeleteC2Controller implements Controller {
    private static final Logger log = LoggerFactory.getLogger(DeleteC2Controller.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
    	System.out.println("c2 delete");
    	int commentId = Integer.parseInt(request.getParameter("commentId"));
    	log.debug("Delete c2_Id : {}", commentId);
    	
		UserManager manager = UserManager.getInstance();			
		manager.removeC2(commentId);
		
		HttpSession session = request.getSession();
		session.setAttribute("postId", request.getParameter("postId"));
		return "redirect:/community/petstar_community/petstar_content";
	}
}
