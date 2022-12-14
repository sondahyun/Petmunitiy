package controller.post;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.UserManager;

public class DeleteP3Controller implements Controller {
    private static final Logger log = LoggerFactory.getLogger(DeleteP3Controller.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
    	int postId = Integer.parseInt(request.getParameter("postId"));
    	log.debug("Delete p3_Id : {}", postId);

		UserManager manager = UserManager.getInstance();			
		manager.removeP3Adoption(postId);
		return "redirect:/community/adopt_community/adopt_community";
	}
}
