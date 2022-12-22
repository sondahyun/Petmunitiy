package controller.apply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.Apply;
import model.service.UserManager;

public class DeleteApplyController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(Apply.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
    	System.out.println("controller가 받은 applyId : "+request.getParameter("applyId"));
    	
		 int applyId = Integer.parseInt(request.getParameter("applyId"));
		 log.debug("Delete applyId : {}", applyId);
		  
		 UserManager manager = UserManager.getInstance();
		 manager.removeApply(applyId);
		 
		return "redirect:/community/adopt_community/adopt_community";
	}
}
