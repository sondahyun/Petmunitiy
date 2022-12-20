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
		
		List<PostGroup> p1List = new ArrayList<PostGroup>();
		List<CommentGroup> c1List = null;
		c1List = manager.findC1WithUser(userId);
		
		List<PostPetstargram> p2List = new ArrayList<PostPetstargram>();
		List<CommentPetstargram> c2List = null;
		c2List = manager.findC2WithUser(userId);
		
		List<PostAdoption> p3List = new ArrayList<PostAdoption>();
		List<CommentAdoption> c3List = null;
		c3List = manager.findC3WithUser(userId);
		
		if(!c0List.isEmpty()) {
			for(CommentInformation ci: c0List) {
				String pi = manager.findP0Title(ci.getPostId());
				p0List.add(pi);
			}
		}
		
		if(!c1List.isEmpty()) {
			for(CommentGroup cg: c1List) {
				PostGroup pg = manager.findP1Group(cg.getPostId());
				p1List.add(pg);
			}	
		}
		
		if(!c2List.isEmpty()) {
			for(CommentPetstargram cp: c2List) {
				PostPetstargram pp = manager.findP2Petstargram(cp.getPostId());
				p2List.add(pp);
			}		
		}
		
		if(!c3List.isEmpty()) {
			for(CommentAdoption ca: c3List) {
				PostAdoption pa = manager.findP3Adoption(ca.getPostId());
				p3List.add(pa);
			}		
		}
		
	/*	List<PostGroup> p1List = null;
		p1List = manager.findP1WithUser(loginId);
		List<PostAdoption> p3List = null;
		p3List = manager.findP3WithUser(loginId);*/
		
		request.setAttribute("loginId", loginId);
		request.setAttribute("c0List", c0List);		
		request.setAttribute("p0List", p0List);
		request.setAttribute("c1List", c1List);
		request.setAttribute("p1List", p1List);
		request.setAttribute("c2List", c2List);
		request.setAttribute("p2List", p2List);
		request.setAttribute("c3List", c3List);
		request.setAttribute("p3List", p3List);
		//request.setAttribute("p1List", p1List);
		//request.setAttribute("p3List", p3List);
		
		return "/myPage/comment_zip.jsp";        
    }
}