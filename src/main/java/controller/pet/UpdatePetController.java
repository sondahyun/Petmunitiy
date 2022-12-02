package controller.pet;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.UserManager;
import model.Pet;
import model.UserInfo;

public class UpdatePetController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdatePetController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
 
    	if (request.getMethod().equals("GET")) {	
    		String updateId = request.getParameter("loginId");

    		log.debug("UpdateForm Request : {}", updateId);
    		
    		UserManager manager = UserManager.getInstance();
			UserInfo user = manager.findUser(updateId);	// �����Ϸ��� ����� ���� �˻�
			request.setAttribute("user", user);			

			/*
			 * HttpSession session = request.getSession(); if
			 * (UserSessionUtils.isLoginUser(updateId, session)) { return
			 * "/user/updateForm.jsp"; // �˻��� ����� ���� �� Ŀ�´�Ƽ ����Ʈ�� updateForm����
			 * ���� }
			 */
			
			// else (���� �Ұ����� ���) ����� ���� ȭ������ ���� �޼����� ����
			request.setAttribute("updateFailed", true);
			request.setAttribute("exception", 
					new IllegalStateException("Ÿ���� ������ ������ �� �����ϴ�."));            
			return "/user/view.jsp";	// ����� ���� ȭ������ �̵� (forwarding)
	    }	
    	
    	//SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    	// POST request (ȸ�������� parameter�� ���۵�)
    	Pet updatePet = new Pet(
    			Integer.parseInt(request.getParameter("petId")),
    			request.getParameter("name"),
    			request.getParameter("gender"),
    			Integer.parseInt(request.getParameter("age")),
    			request.getParameter("health"),
    			request.getParameter("vaccination"),
    			request.getParameter("kind"),
    			request.getParameter("filename"),
    			request.getParameter("loginId")
    			);
    	
    	log.debug("Update Pet : {}", updatePet);

		UserManager manager = UserManager.getInstance();
		manager.updatePet(updatePet);			
        return "redirect:/user/list";			
    }
    
}