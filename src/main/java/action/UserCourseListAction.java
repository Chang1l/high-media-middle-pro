package action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import svc.UserCoruseListService;
import vo.ActionForward;
import vo.CourseBean;
import vo.PageInfo;

 public class UserCourseListAction implements Action {
	 
	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
		 
		ArrayList<CourseBean> courseList=new ArrayList<CourseBean>();
	  	int page=1;
		int limit=8;
		
		if(request.getParameter("page")!=null){
			page=Integer.parseInt(request.getParameter("page"));
		}
		
		UserCoruseListService courseListService = new UserCoruseListService();
		int listCount=courseListService.getUserListCount(); //총 리스트 수를 받아옴.
		courseList = courseListService.getUserCourseList(page,limit); //리스트를 받아옴.
		//총 페이지 수.
   		int maxPage;
		if(listCount%limit >0) {
			maxPage =  listCount/limit +1;
		}else {
			maxPage =  listCount/limit;
		}
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   	     
   		//현재 페이지에 보여줄 시작 페이지 수(1, 11, 21 등...)
   		int startPage = (((int) ((double)page / 10+ 0.9)) - 1) * 10 + 1;
   		//현재 페이지에 보여줄 마지막 페이지 수.(10, 20, 30 등...)
   	    int endPage = startPage+10-1;
   	    
   		if (endPage> maxPage) endPage= maxPage;

   		PageInfo pageInfo = new PageInfo();
   		pageInfo.setEndPage(endPage);
   		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		request.setAttribute("pageInfo", pageInfo);
		request.setAttribute("courseList", courseList);
		ActionForward forward= new ActionForward();
   		forward.setPath("/user/user_course_list.jsp");
   		return forward;
   		
	 }
	 
 }