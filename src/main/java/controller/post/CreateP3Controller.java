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
import model.PostInformation;
import model.service.UserManager;

public class CreateP3Controller implements Controller {
    private static final Logger log = LoggerFactory.getLogger(PostAdoption.class);
    
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	if (request.getMethod().equals("GET")) {	
			// GET request: 회원정보 등록 form 요청	
			log.debug("adopt_community add");
			return "/community/adopt_community/add_content.jsp";   //  registerForm���� ����     	
		}
    	System.out.print("create P3 controller");
    	HttpSession session = request.getSession();
       	Object loginId = session.getAttribute("loginId");
       	       	
       	System.out.println(request.getParameter("postTitle"));
       	System.out.println(request.getParameter("aType"));
       	System.out.println(request.getParameter("approval"));
       	System.out.println(request.getParameter("postContent"));
       	
       	System.out.println(request.getParameter("gender"));
       	System.out.println(request.getParameter("age"));
       	System.out.println(request.getParameter("health"));
       	System.out.println(request.getParameter("vaccination"));
       	System.out.println(request.getParameter("kind"));
       	//System.out.println(request.getParameter("filename"));
       	
       	String filename = null;
       	if(request.getParameter("filename")!=null)
       		filename = request.getParameter("filename");
       	
       	UserManager manager = UserManager.getInstance();
       	        
		try {			
			PostAdoption pA = new PostAdoption(
		    		request.getParameter("postTitle"),
					Integer.parseInt(request.getParameter("aType")),
					Integer.parseInt(request.getParameter("approval")),
					request.getParameter("postContent"),
					String.valueOf(loginId)
				);
			
			manager.createP3Adoption(pA);
	    	log.debug("Create PostAdoption : {}", pA);
	    	
	    	//System.out.println("pA postId : "+pA.getPostId());
	    	
	    	AdoptionAnimal aA = new AdoptionAnimal(
		    		request.getParameter("gender"),
		    		Integer.parseInt(request.getParameter("age")),
		    		request.getParameter("health"),
		    		request.getParameter("vaccination"),
		    		request.getParameter("kind"),
		    		filename
	    		);

			manager.createAdoptionAnimal(aA);
	    	log.debug("Create AdoptionAnimal : {}", aA);
	    	
	    	List<PostAdoption> p3List = manager.findP3List();
			request.setAttribute("p3List", p3List);
	    	
			return "redirect:/community/adopt_community/adopt_community";
	        //return "/community/adopt_community/adopt_community.jsp";	// 성공 시 커뮤니티 리스트 화면으로 redirect
	        
		} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
            request.setAttribute("creationFailed", true);
			request.setAttribute("exception", e);
			//request.setAttribute("pA", pA);
			
			List<PostAdoption> p3List = manager.findP3List();
			request.setAttribute("p3List", p3List);
			
			return "/community/adopt_community/adopt_community.jsp";
		}
    }
}
