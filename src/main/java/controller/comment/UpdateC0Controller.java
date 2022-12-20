package controller.comment;

import java.text.SimpleDateFormat;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import controller.Controller;
import controller.user.UserSessionUtils;
import model.CommentInformation;
import model.service.UserManager;

public class UpdateC0Controller implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdateC0Controller.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
 
		int commentId = Integer.parseInt(request.getParameter("commentId"));
		HttpSession session = request.getSession();

       	System.out.println("commentP0 update");
       	
       	int userId = UserSessionUtils.getLoginUserId(session);
       	int postId = Integer.parseInt(request.getParameter("postId"));
       	String content = request.getParameter("commentContent");
       	
        if(content == null)
           content = "댓글 작성 실패";

       	System.out.println("userId, postId, content : "+ userId+" "+postId+" "+content);

    	session.setAttribute("postId", String.valueOf(postId));

		try {
			UserManager manager = UserManager.getInstance();
			CommentInformation ci = new CommentInformation(
					commentId,
					content,
					postId,
					userId);	
			manager.updateC0(ci);
			
	    	log.debug("Update CommentInformation : {}", ci);
	        return "redirect:/community/info_community/info_content";	// 성공 시 커뮤니티 화면으로 redirect
	        
		} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
            request.setAttribute("creationFailed", true);
			request.setAttribute("exception", e);
			return "/community/info_community/info_content.jsp";
		}		
    }
}
