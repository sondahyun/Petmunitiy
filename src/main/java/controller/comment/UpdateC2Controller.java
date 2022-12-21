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
import model.CommentPetstargram;
import model.service.UserManager;

public class UpdateC2Controller implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdateC2Controller.class);

    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
       	System.out.println("commentP2 update");
       	
		int commentId = Integer.parseInt(request.getParameter("commentId"));
		HttpSession session = request.getSession();

       	
       	int userId = UserSessionUtils.getLoginUserId(session);
       	int postId = Integer.parseInt(request.getParameter("postId"));
       	String content = request.getParameter("commentContent");
       	
        if(content == null)
           content = "댓글 작성 실패";

       	System.out.println("userId, postId, content : "+ userId+" "+postId+" "+content);

    	session.setAttribute("postId", String.valueOf(postId));

		try {
			UserManager manager = UserManager.getInstance();
			CommentPetstargram cp = new CommentPetstargram(
					commentId,
					content,
					postId,
					userId);	
			manager.updateC2(cp);
			
	    	log.debug("Update CommentPetstargram : {}", cp);
	        return "redirect:/community/petstar_community/petstar_content";	// 성공 시 커뮤니티 화면으로 redirect
	        
		} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
            request.setAttribute("creationFailed", true);
			request.setAttribute("exception", e);
			return "/community/petstar_community/petstar_content.jsp";
		}		
    }
}
