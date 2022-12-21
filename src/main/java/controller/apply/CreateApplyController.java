package controller.apply;

import java.text.SimpleDateFormat;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.Controller;
import model.Apply;
import model.service.UserManager;

public class CreateApplyController implements Controller {
	private static final Logger log = LoggerFactory.getLogger(Apply.class);
	@Override
	public String execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		
		String phone1= null;
       	
       	switch(request.getParameter("phone1")) {
       	case "0":
       		phone1 = "010";
       		break;
       	case "1":
       		phone1 = "080";
       		break;
       	case "2":
       		phone1 = "070";
       		break;
       	case "3":
       		phone1 = "02";
       		break;
       	}
       	String phoneNumber = phone1+"-"+request.getParameter("phone2")+"-"+request.getParameter("phone3");
       	
       	//System.out.println("name : "+request.getParameter("name"));
       	//System.out.println("aType : "+request.getParameter("aType"));
       	//System.out.println("birth : "+request.getParameter("birth"));
       	//System.out.println("phoneNumber : "+phoneNumber);
       	//System.out.println("hopeConditions : "+request.getParameter("hopeConditions"));
       	//System.out.println("allergy : "+request.getParameter("allergy"));
       	//System.out.println("address : "+request.getParameter("address"));
       	//System.out.println("housingType"+request.getParameter("housingType"));
       	//System.out.println("resolution : "+request.getParameter("resolution"));
       	//System.out.println("etc : "+request.getParameter("etc"));
       	//System.out.println("petId : "+request.getParameter("petId"));
       	
       	log.debug("before Create Apply : {}");
       	System.out.println("postId : "+request.getParameter("postId"));
       	
		Apply apply = new Apply(
				request.getParameter("name"),
				Integer.parseInt(request.getParameter("aType")),
				formatter.parse(request.getParameter("birth")),
				phoneNumber,
				request.getParameter("hopeConditions"),
				request.getParameter("allergy"),
				request.getParameter("address"),
				request.getParameter("housingType"),
				request.getParameter("resolution"),
				request.getParameter("etc"),
				Integer.parseInt(request.getParameter("petId"))
				);
		
		try {
			UserManager manager = UserManager.getInstance();
			manager.createApply(apply);

			log.debug("Create Apply : {}", apply);
			
			HttpSession session = request.getSession();
			session.setAttribute("postId", request.getParameter("postId"));
			return "redirect:/community/adopt_community/adopt_info";	// 성공 시 커뮤니티 리스트 화면으로 redirect

		} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
			request.setAttribute("creationFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("apply", apply);
			return "/community/adopt_community/adopt_info.jsp";
		}
	}
}
