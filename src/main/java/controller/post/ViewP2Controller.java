package controller.post;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.service.UserManager;
import model.CommentPetstargram;
import model.PostPetstargram;

public class ViewP2Controller implements Controller {
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();

		System.out.println("loginId : " + request.getSession().getAttribute("loginId"));

		if (!UserSessionUtils.hasLogined(request.getSession())) {
			return "/user/loginForm.jsp";
		}

		UserManager manager = UserManager.getInstance();
		int postId = -1;
		if (request.getParameter("postId") != null)
			postId = Integer.parseInt(request.getParameter("postId"));
		else
			postId = Integer.parseInt((String) session.getAttribute("postId"));

		PostPetstargram post = null;
		post = manager.findP2Petstargram(postId);
		request.setAttribute("p2", post);

		List<CommentPetstargram> c2List = manager.findC2List();
		request.setAttribute("c2List", c2List);

		// /community/info_community/cmList
		return "/community/petstar_community/petstar_content.jsp";
	}
}
