package controller.comment;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model. *;
import model.service.UserManager;

public class ListCommentCreateController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(ListCommentCreateController.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
    	log.debug("Create : ListCommentCreateController");

    	UserManager manager = UserManager.getInstance();
    	HttpSession session = request.getSession();
		int userId = UserSessionUtils.getLoginUserId(session);
		String loginId = UserSessionUtils.getLoginId(session);
		
		List<String> p0List = new ArrayList<String>();
		List<CommentInformation> c0List = null;
		c0List = manager.findC0WithUser(userId);
		
		List<String> p2List = new ArrayList<String>();
		List<CommentPetstargram> c2List = null;
		c2List = manager.findC2WithUser(userId);
		
		
		if(!c0List.isEmpty()) {
			for(CommentInformation ci: c0List) {
				System.out.println(ci.getPostId());
				String pi = manager.findP0Title(ci.getPostId());
				System.out.println(pi);
				p0List.add(pi);
			}
		}
		
		
		if(!c2List.isEmpty()) {
			for(CommentPetstargram cp: c2List) {
				String pp = manager.findP2Title(cp.getPostId());
				p2List.add(pp);
			}		
		}
	
		
	/*	List<PostGroup> p1List = null;
		p1List = manager.findP1WithUser(loginId);
		List<PostAdoption> p3List = null;
		p3List = manager.findP3WithUser(loginId);*/
		
		request.setAttribute("loginId", loginId);
		request.setAttribute("c0List", c0List);		
		request.setAttribute("p0List", p0List);
		
		request.setAttribute("c2List", c2List);
		request.setAttribute("p2List", p2List);
		
		//request.setAttribute("p1List", p1List);
		//request.setAttribute("p3List", p3List);
		
		return "/myPage/comment_zip.jsp";        
    }
}
