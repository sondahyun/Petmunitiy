package controller.post;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.PostGroup;
import model.UserInfo;
import model.service.UserManager;

public class ListP1Controller implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
    	UserManager manager = UserManager.getInstance();
		HttpSession session = request.getSession();	

		List<PostGroup> p1List = manager.findP1List();
		String loginId = UserSessionUtils.getLoginId(session);
		UserInfo user = manager.findUser(loginId);
		// commList 객체를 request에 저장하여 커뮤니티 리스트 화면으로 이동(forwarding)
		request.setAttribute("p1List", p1List);
		request.setAttribute("user", user);
		for(PostGroup pg :p1List) {
			System.out.println(pg.toString());
		}
		return "/community/group_community/group_community.jsp";        
    }
}
