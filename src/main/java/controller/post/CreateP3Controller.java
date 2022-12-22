package controller.post;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.FileUploadBase.SizeLimitExceededException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.AdoptionAnimal;
import model.PostAdoption;
import model.service.UserManager;

public class CreateP3Controller implements Controller {
    private static final Logger log = LoggerFactory.getLogger(PostAdoption.class);
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	if (request.getMethod().equals("GET")) {	
			// GET request: 회원정보 등록 form 요청	
			log.debug("adopt_community add");
			//System.out.println("여기1");
			return "/community/adopt_community/add_content.jsp";   //  registerForm���� ����     	
		}
    	
    	HttpSession session = request.getSession();
       	Object loginId = session.getAttribute("loginId");
       	
		PostAdoption pA = new PostAdoption(
    		request.getParameter("postTitle"),
			Integer.parseInt(request.getParameter("aType")),
			Integer.parseInt(request.getParameter("approval")),
			request.getParameter("postContent"),
			String.valueOf(loginId)
		);
		AdoptionAnimal aA = new AdoptionAnimal(
       			request.getParameter("gender"),
       			Integer.parseInt(request.getParameter("age")),
       			request.getParameter("health"),
       			request.getParameter("vaccination"),
       			request.getParameter("kind"),
       			request.getParameter("filename"),
       			pA.getPostId()
			);
        
		try {
			UserManager manager = UserManager.getInstance();
			manager.createP3Adoption(pA);
			manager.createAdoptionAnimal(aA);
			
	    	log.debug("Create PostAdoption : {}", pA);
	        return "redirect:/community/adopt_community";	// 성공 시 커뮤니티 리스트 화면으로 redirect
	        
		} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
            request.setAttribute("creationFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("pA", pA);
			return "/community/creationP3Form.jsp";
		}
    }
}
