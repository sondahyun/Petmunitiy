package controller;

import java.util.HashMap;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import controller.post.ListP0Controller;
import controller.post.ListP3Controller;
import controller.user.*;

public class RequestMapping {
    private static final Logger logger = LoggerFactory.getLogger(DispatcherServlet.class);
    
    // 각 요청 uri에 대한 controller 객체를 저장할 HashMap 생성
    private Map<String, Controller> mappings = new HashMap<String, Controller>();

    public void initMapping() {

    	// �� uri�� �����Ǵ� controller ��ü�� ���� �� ����
        mappings.put("/", new ForwardController("/index.jsp"));
        mappings.put("/navbar", new ForwardController("/navbar.jsp"));
        
        //입양게시판
        mappings.put("/community/adopt_community/adopt_community", new ListP3Controller());
        mappings.put("/community/adopt_community/apply_form", new ForwardController("/community/adopt_community/apply_form.jsp"));
        mappings.put("/community/adopt_community/adopt_info", new ForwardController("/community/adopt_community/adopt_info.jsp"));
        mappings.put("/community/adopt_community/apply_form2", new ForwardController("/community/adopt_community/apply_form2.jsp"));
        mappings.put("/community/adopt_community/apply_result", new ForwardController("/community/adopt_community/apply_result.jsp"));
        mappings.put("/community/adopt_community/apply_result_closer", new ForwardController("/community/adopt_community/apply_result_closer.jsp"));

        //펫스타그램
        mappings.put("/community/petstar_community/petstar_community", new ForwardController("/community/petstar_community/petstar_community.jsp"));
        mappings.put("/community/petstar_community/petstar_content", new ForwardController("/community/petstar_community/petstar_content.jsp"));
        
        
        //그룹게시판
        mappings.put("/community/group_community/group_community", new ForwardController("/community/group_community/group_community.jsp"));
        
        
        //검색게시판
        mappings.put("/search/search", new ForwardController("/search/search.jsp"));
        

        //정보게시판     
        mappings.put("/community/info_community/info_community", new ListP0Controller());
        mappings.put("/community/info_community/info_content", new ForwardController("/community/info_community/info_content.jsp"));
        mappings.put("/community/info_community/info_comment", new ForwardController("/community/info_community/info_comment.jsp"));
        mappings.put("/community/info_community/modal", new ForwardController("/community/info_community/modal.jsp"));

        //myPage
        mappings.put("/myPage/myPage", new ForwardController("/myPage/myPage.jsp"));
        mappings.put("/myPage/content_zip", new ForwardController("/myPage/content_zip.jsp"));
        mappings.put("/myPage/comment_zip", new ForwardController("/myPage/comment_zip.jsp"));

        //user
        mappings.put("/main/main", new ForwardController("/main/main.jsp"));
        mappings.put("/user/login/form", new ForwardController("/user/loginForm.jsp"));
        mappings.put("/user/login", new LoginController());
        mappings.put("/user/logout", new LogoutController());
        mappings.put("/user/view", new ViewUserController());
        mappings.put("/user/user_update", new ForwardController("/user/user_update.jsp"));
        
 
        // 회원 가입 폼 요청과 가입 요청 처리 병합 (폼에 커뮤니티 선택 메뉴 추가를 위함)
//      mappings.put("/user/register/form", new ForwardController("/user/registerForm.jsp"));
//      mappings.put("/user/register", new RegisterUserController());
        mappings.put("/user/register", new RegisterUserController());

        // 사용자 정보 수정 폼 요청과 수정 요청 처리 병합
//      mappings.put("/user/update/form", new UpdateUserFormController());
//      mappings.put("/user/update", new UpdateUserController());        
        mappings.put("/user/update", new UpdateUserController());
        
        mappings.put("/user/delete", new DeleteUserController());
        
		/*
		 * // 커뮤니티 관련 request URI 추가 mappings.put("/community/list", new
		 * ListCommunityController()); mappings.put("/community/view", new
		 * ViewCommunityController()); mappings.put("/community/create/form", new
		 * ForwardController("/community/creationForm.jsp"));
		 * mappings.put("/community/create", new CreateCommunityController());
		 * mappings.put("/community/update", new UpdateCommunityController());
		 */
        logger.info("Initialized Request Mapping!");
    }

    public Controller findController(String uri) {	
    	// 주어진 uri에 대응되는 controller 객체를 찾아 반환
        return mappings.get(uri);
    }
}