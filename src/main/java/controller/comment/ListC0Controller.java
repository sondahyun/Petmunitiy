package controller.comment;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.CommentInformation;
import model.service.UserManager;

public class ListC0Controller implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
		/*
		 * UserManager manager = UserManager.getInstance(); List<CommentInformation>
		 * c0List = manager.findC0List();
		 * 
		 * // commList 객체를 request에 저장하여 커뮤니티 리스트 화면으로 이동(forwarding)
		 * request.setAttribute("c0List", c0List); return
		 * "/community/info_community/info_content.jsp";
		 */        
    	return null;
    }
}
