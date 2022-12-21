package controller.message;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.Controller;
import controller.user.UserSessionUtils;
import model.Message;
import model.service.UserManager;

public class ListMSenderController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		// 로그인 여부 확인
    	if (!UserSessionUtils.hasLogined(request.getSession())) {
            return "redirect:/user/login/form";		// login form 요청으로 redirect
        }
    	
    	HttpSession session = request.getSession();
    	int userId = UserSessionUtils.getLoginUserId(session);
    	
		UserManager manager = UserManager.getInstance();
		List<Message> mList = manager.findMessageWithSender(userId);
		// List<User> userList = manager.findUserList(currentPage, countPerPage);

		// userList 객체와 현재 로그인한 사용자 ID를 request에 저장하여 전달
		request.setAttribute("mList", mList);				

		// 사용자 리스트 화면으로 이동(forwarding)
		return "/message/message.jsp";        
    }
}
