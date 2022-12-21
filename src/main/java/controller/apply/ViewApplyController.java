package controller.apply;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.UserManager;
import model.AdoptionAnimal;
import model.PostAdoption;
import model.PostInformation;
import model.UserInfo;

public class ViewApplyController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(PostAdoption.class);
    
	
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
    		return "/user/loginForm.jsp"; 
    	}
    	log.debug("등록된 신청서 상세보기 controller : {}");
		UserManager manager = UserManager.getInstance();
		
		AdoptionAnimal aA = (AdoptionAnimal)request.getAttribute("adoptAnimal");
		request.setAttribute("adoptAnimal", aA);		// ����� ���� ����				
		return "/community/adopt_community/adopt_info.jsp";				// ����� ���� ȭ������ �̵�
 	
    }

}
