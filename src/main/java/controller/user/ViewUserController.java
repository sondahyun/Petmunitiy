package controller.user;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.UserManager;
import model.Pet;
import model.UserInfo;

public class ViewUserController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(ViewUserController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {			
    	
    	log.debug("Create : viewUserController");
		UserManager manager = UserManager.getInstance();
		HttpSession session = request.getSession();
		String loginId = UserSessionUtils.getLoginId(session);
    	UserInfo user = null;
    	Pet pet = null;
		user = manager.findUser(loginId);
		pet = manager.findPet(loginId);
		
		request.setAttribute("user", user);	
		request.setAttribute("pet", pet);// ����� ���� ����				
		return "/myPage/myPage.jsp";				// ����� ���� ȭ������ �̵�
    }
}
