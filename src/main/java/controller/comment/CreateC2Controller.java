package controller.comment;

import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.CommentPetstargram;
import model.PostPetstargram;
import model.service.UserManager;

public class CreateC2Controller implements Controller {
    private static final Logger log = LoggerFactory.getLogger(CommentPetstargram.class);
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		/*
		 * if (request.getMethod().equals("GET")) { log.debug("info_community add");
		 * return "/community/info_community/add_content.jsp"; // registerForm���� ����
		 * }
		 */
    	HttpSession session = request.getSession();

       	System.out.println("commentP2");
       	
       	int userId = UserSessionUtils.getLoginUserId(session);
       	int postId = Integer.parseInt(request.getParameter("postId"));
       	String content = request.getParameter("commentContent");
       	
        if(content == null)
           content = "댓글 작성 실패";

       	System.out.println("userId, postId, content : "+ userId+" "+postId+" "+content);

    	session.setAttribute("postId", String.valueOf(postId));

       	
		CommentPetstargram ci = new CommentPetstargram(
			content,
			postId,
			userId
			);		
		
		try {
			UserManager manager = UserManager.getInstance();
			manager.createC2(ci);
			
	    	log.debug("Create CommentPetstargram : {}", ci);
	        return "redirect:/community/petstar_community/petstar_content";	// 성공 시 커뮤니티 화면으로 redirect
	        
		} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
            request.setAttribute("creationFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("ci", ci);
			return "/community/petstar_community/petstar_content.jsp";
		}
    }
}
