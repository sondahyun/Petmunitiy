package controller.user;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.service.UserManager;
import model.UserInfo;

public class UpdateUserController implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdateUserController.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
 
    	if (request.getMethod().equals("GET")) {	
    		// GET request: ȸ������ ���� form ��û	
    		// ������ UpdateUserFormController�� ó���ϴ� �۾��� ���⼭ ����
			HttpSession session = request.getSession();
    		String updateId = UserSessionUtils.getLoginId(session);

    		log.debug("UpdateForm Request : {}", updateId);
    		
    		UserManager manager = UserManager.getInstance();
			UserInfo user = manager.findUser(updateId);	// �����Ϸ��� ����� ���� �˻�
			request.setAttribute("user", user);			
			return "/user/user_update.jsp";
			
    	}
			
    	SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
    	// POST request (ȸ�������� parameter�� ���۵�)
    	UserInfo updateUser = new UserInfo(
    			request.getParameter("loginId"),
    			request.getParameter("loginPwd"),
    			request.getParameter("userNickname"),
    			formatter.parse(request.getParameter("userBirth")),
    			request.getParameter("phoneNumber"),
    			request.getParameter("gender"),
    			request.getParameter("address"),
    			request.getParameter("email")
    			);
    	log.debug("Update User : {}", updateUser);

		UserManager manager = UserManager.getInstance();
		manager.update(updateUser);			
        return "redirect:/";			
    }
	/*
	 * public static ArrayList<Integer> stringToArrayList(String input){ String[] s
	 * = input.split(","); ArrayList<Integer> list = new ArrayList<>(); for(int a =
	 * 0; a<s.length; a++) { list.add(Integer.parseInt(s[a])); } return list; }
	 */
}