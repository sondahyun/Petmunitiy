package controller.post;

import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import controller.Controller;
import model.service.UserManager;
import model.AdoptionAnimal;
import model.PostAdoption;

public class UpdateP3Controller implements Controller {
    private static final Logger log = LoggerFactory.getLogger(UpdateP3Controller.class);
    HttpSession session;
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
    	session = request.getSession();
		int postId = Integer.parseInt(request.getParameter("postId"));
		
		if (request.getMethod().equals("GET")) {	
    		// GET request: 커뮤니티 수정 form 요청	
    		UserManager manager = UserManager.getInstance();
			PostAdoption post = manager.findP3Adoption(postId);	// 수정하려는 커뮤니티 정보 검색
			request.setAttribute("p3PostId", postId);			
			
			return "/community/updateForm.jsp";   // 검색한 정보를 update form으로 전송     
	    }	
    	
    	// POST request (커뮤니티 정보가 parameter로 전송됨)
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Object loginId = session.getAttribute("loginId");
		AdoptionAnimal aa = new AdoptionAnimal(
                Integer.parseInt(request.getParameter("petId")),
                request.getParameter("gender"),
                Integer.parseInt(request.getParameter("age")),
                request.getParameter("health"),
                request.getParameter("vaccination"),
                request.getParameter("kind"),
                request.getParameter("fileName"),
                Integer.parseInt(request.getParameter("postId"))          
                );
		PostAdoption pA = new PostAdoption(
	    		request.getParameter("postTitle"),
				formatter.parse(request.getParameter("postDate")),
				Integer.parseInt(request.getParameter("aType")),
				Integer.parseInt(request.getParameter("approval")),
				formatter.parse(request.getParameter("approvalDate")),
				request.getParameter("postContent"),
				String.valueOf(loginId),
				aa
				);

    	log.debug("Update postAdoption : {}", pA);

		UserManager manager = UserManager.getInstance();
		manager.updateP3Adoption(pA);			
        return "redirect:/community/adopt_community";			
    }
}
