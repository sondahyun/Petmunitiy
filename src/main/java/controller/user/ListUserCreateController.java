package controller.user;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model. *;
import model.service.UserManager;

public class ListUserCreateController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(ListUserCreateController.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
    	log.debug("Create : ListUserCreateController");

    	UserManager manager = UserManager.getInstance();
    	HttpSession session = request.getSession();
		String loginId = UserSessionUtils.getLoginId(session);
		
		List<PostInformation> p0List = null;
		p0List = manager.findP0WithUser(loginId);
		List<PostGroup> p1List = null;
		p1List = manager.findP1WithUser(loginId);
		List<PostAdoption> p3List = null;
		p3List = manager.findP3WithUser(loginId);
		
		// commList 객체를 request에 저장하여 커뮤니티 리스트 화면으로 이동(forwarding)
		request.setAttribute("p0List", p0List);		
		request.setAttribute("p1List", p1List);
		request.setAttribute("p3List", p3List);
		
		return "/myPage/content_zip.jsp";        
    }
}
