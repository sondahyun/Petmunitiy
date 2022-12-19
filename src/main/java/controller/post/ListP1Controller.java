package controller.post;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.PostGroup;
import model.service.UserManager;

public class ListP1Controller implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
    	UserManager manager = UserManager.getInstance();
		List<PostGroup> p1List = manager.findP1List();
		
		// commList 객체를 request에 저장하여 커뮤니티 리스트 화면으로 이동(forwarding)
		request.setAttribute("p1List", p1List);				
		return "/community/group_community/group_community.jsp";        
    }
}
