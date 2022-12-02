package controller.post;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.PostAdoption;
import model.service.UserManager;

public class ListP3Controller implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
    	UserManager manager = UserManager.getInstance();
		List<PostAdoption> p3List = manager.findP3List();
		
		// commList 객체를 request에 저장하여 커뮤니티 리스트 화면으로 이동(forwarding)
		request.setAttribute("p3List", p3List);				
		return "/community/adopt_community/adopt_main.jsp";        
    }
}
