package controller.post;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.*;
import model.service.UserManager;

public class MainController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
    	System.out.println("여기입니다.");
    	UserManager manager = UserManager.getInstance();
		List<PostInformation> p0List = manager.findP0List();
		List<PostGroup> p1List = manager.findP1List();
		List<PostPetstargram> p2List = manager.findP2List();
		List<PostAdoption> p3List = manager.findP3List();

		// commList 객체를 request에 저장하여 커뮤니티 리스트 화면으로 이동(forwarding)
		if(p0List== null) {
			System.out.println("비어있습니다");
		}
		else {
			System.out.println("비어있지 않습니다");

		}
		request.setAttribute("p0List", p0List);			
		request.setAttribute("p1List", p1List);				
		request.setAttribute("p2List", p2List);				
		request.setAttribute("p3List", p3List);		
		
		
		return "/main/main.jsp";        
    }
}
