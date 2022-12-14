package controller.post;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import controller.Controller;
import model.*;
import model.service.UserManager;

public class ListSearchController implements Controller {
    @Override
    public String execute(HttpServletRequest request, HttpServletResponse response)	throws Exception {
		
    	UserManager manager = UserManager.getInstance();
    	List<PostInformation> p0List=null;
    	List<PostGroup> p1List = null;
    	List<PostPetstargram> p2List = null;
    	List<PostAdoption> p3List = null;
    	
    	int community = 0;
    	if(request.getParameter("community") != null) community = Integer.parseInt(request.getParameter("community"));
    	System.out.println(community);
    	
    	request.setAttribute("comm", String.valueOf(community));
    	
		if(request.getParameter("word")==null) {
	    	p0List = manager.findP0List();
			p1List = manager.findP1List();
			p2List = manager.findP2List();
			p3List = manager.findP3List();
		}else {
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
			String word = "";
			
			if(request.getParameter("word")!=null)
				word = request.getParameter("word");
			
			p0List = manager.searchP0List(word, formatter.parse(request.getParameter("start")), formatter.parse(request.getParameter("end")));
			p1List = manager.searchP1List(word, formatter.parse(request.getParameter("start")), formatter.parse(request.getParameter("end")));
			p2List = manager.searchP2List(word, formatter.parse(request.getParameter("start")), formatter.parse(request.getParameter("end")));
			p3List = manager.searchP3List(word, formatter.parse(request.getParameter("start")), formatter.parse(request.getParameter("end")));
			
			//System.out.println(p0List.size()+" "+p1List.size()+" "+p2List.size()+" "+p3List.size()+" ");
		}
		
		
		request.setAttribute("p0List", p0List);
		request.setAttribute("p1List", p1List);
		request.setAttribute("p2List", p2List);
		request.setAttribute("p3List", p3List);
		
		return "/search/search.jsp";
    }
}
