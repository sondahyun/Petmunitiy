package controller.apply;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.UserManager;
import model.AdoptionAnimal;
import model.Apply;

public class ViewApplyController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(Apply.class);
    
	
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
    		return "/user/loginForm.jsp"; 
    	}
    	log.debug("등록된 신청서 상세보기 controller : {}");
    	int applyId = Integer.parseInt(request.getParameter("applyId"));
    	
		UserManager manager = UserManager.getInstance();
		Apply applyA = null;
		applyA = manager.findApply(applyId);	
		request.setAttribute("applyA", applyA);
		
		//AdoptionAnimal aA = (AdoptionAnimal)request.getAttribute("adoptAnimal");
		//request.setAttribute("adoptAnimal", aA);		// ����� ���� ����
		return "/community/adopt_community/apply_result_closer.jsp";			// ����� ���� ȭ������ �̵�
 	
    }

}
