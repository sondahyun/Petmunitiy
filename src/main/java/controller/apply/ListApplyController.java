package controller.apply;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import controller.Controller;
import model.Apply;
import model.service.UserManager;

public class ListApplyController implements Controller {
	@Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
    	UserManager manager = UserManager.getInstance();
		List<Apply> aList = manager.findApplyList();
		
		// commList 객체를 request에 저장하여 커뮤니티 리스트 화면으로 이동(forwarding)
		request.setAttribute("aList", aList);				
		return "/community/petstar_community/apply_results.jsp";        
    }
}
