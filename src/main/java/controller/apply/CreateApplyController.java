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

		Apply apply = new Apply(
				request.getParameter("name"),
				Integer.parseInt(request.getParameter("aType")),
				formatter.parse(request.getParameter("birth")),
				request.getParameter("phoneNumber"),
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
			return "redirect:/community/info_community";	// 성공 시 커뮤니티 리스트 화면으로 redirect

		} catch (Exception e) {		// 예외 발생 시 입력 form으로 forwarding
			request.setAttribute("creationFailed", true);
			request.setAttribute("exception", e);
			request.setAttribute("apply", apply);
			return "/community/creationForm.jsp";
		}
	}
}
