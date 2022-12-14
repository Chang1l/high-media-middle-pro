package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.AllReviewDeleteAction;
import action.AllReviewListAction;
import action.AllReviewSendAction;
import action.AllReviewWriteAction;
import action.BoardDeleteProAction;
import action.BoardDetailAction;
import action.BoardListAction;
import action.BoardModifyFormAction;
import action.BoardModifyProAction;
import action.BoardReplyDeleteProAction;
import action.BoardReplyProAction;
import action.BoardReplyUpdateProAction;
import action.BoardWriteProAction;
import action.CourseDeleteProAction;
import action.CourseDetailAction;
import action.CourseListAction;
import action.CourseModifyFormAction;
import action.CourseModifyProAction;
import action.CourseSearchAction;
import action.CourseWriteProAction;
import action.IndexAction;
import action.MemberDeleteAction;
import action.MemberFindIdAction;
import action.MemberFindPwAction;
import action.MemberJoinAction;
import action.MemberListAction;
import action.MemberLoginAction;
import action.MemberUpdateAction;
import action.MemberViewAction;
import action.ProfessorDeleteAction;
import action.ProfessorInsertAction;
import action.ProfessorListClientAction;
import action.ProfessorListManagerAction;
import action.ProfessorUpdateAction;
import action.ProfessorUpdateFormAction;
import action.RegistDeleteAction;
import action.RegistInsertAction;
import action.RegistListAction;
import action.ReviewDeleteAction;
import action.ReviewListAction;
import action.ReviewModifyAction;
import action.ReviewModifyGoAction;
import action.ReviewWriteAction;
import action.SearchAction;
import action.UserCourseDetailAction;
import action.UserCourseListAction;
import action.UserCourseSearchAction;
import vo.ActionForward;

@WebServlet("*.me")
public class FrontController extends javax.servlet.http.HttpServlet 
{

	protected void doProcess(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		ActionForward forward=null;
		Action action=null;

		if(command.equals("/boardWriteForm.me")){//?????????
			forward=new ActionForward();
			forward.setPath("/board/qna_board_write.jsp");
			
		}else if(command.equals("/boardWritePro.me")){
			action  = new BoardWriteProAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardList.me")){//?????????
			action = new BoardListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardDetail.me")){//??? ????????????
			action = new BoardDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
	
		else if(command.equals("/boardReplyPro.me")){//??????
			action = new BoardReplyProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardModifyForm.me")){//????????????
			action = new BoardModifyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/boardModifyPro.me")){//?????????
			action = new BoardModifyProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/boardDeletePro.me")){//??????
			action = new BoardDeleteProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}	else if(command.equals("/boardReplyDeletePro.me")) {//????????????
			action = new BoardReplyDeleteProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}else if(command.equals("/boardReplyUpdatePro.me")) {//????????????
			action = new BoardReplyUpdateProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}else if(command.equals("/searchAction.me")) {//??????
			action = new SearchAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}else if(command.equals("/courseWriteForm.me")){//???????????????
			forward=new ActionForward();
			forward.setPath("/course/course_write.jsp");
			
		}else if(command.equals("/courseWritePro.me")){//????????????
			action  = new CourseWriteProAction();
			try {
				forward=action.execute(request, response );
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/courseList.me")){//????????????
			action = new CourseListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/courseDetail.me")){//?????? ????????????
			action = new CourseDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		else if(command.equals("/courseModifyForm.me")){//???????????????
			action = new CourseModifyFormAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/courseModifyPro.me")){//?????? ??????
			action = new CourseModifyProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/courseDeleteForm.me")){//?????? ?????? ???
			String nowPage = request.getParameter("page");
			request.setAttribute("page", nowPage);
			int c_no=Integer.parseInt(request.getParameter("c_no"));
			request.setAttribute("c_no",c_no);
			forward=new ActionForward();
			forward.setPath("/course/course_delete.jsp");
		}else if(command.equals("/courseSearchAction.me")) {
	         action = new CourseSearchAction();
	         try{
	            forward=action.execute(request, response);
	         }catch(Exception e){
	            e.printStackTrace();
	         }
	      }else if(command.equals("/courseDeletePro.me")){//?????? ??????
			
			action = new CourseDeleteProAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}else if(command.equals("/usercourseList.me")){
			action = new UserCourseListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/usersearchAction.me")) {
			action = new UserCourseSearchAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}else if(command.equals("/usercourseDetail.me")){
			action = new UserCourseDetailAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		else if (command.equals("/memberLogin.me")) { // ?????????
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/member/loginForm.jsp");
		} else if (command.equals("/memberJoin.me")) { // ????????????
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/member/joinForm.jsp");
		} else if (command.equals("/memberLoginAction.me")) { // ?????????
			action = new MemberLoginAction();
			// ????????? ????????? ???????????? ??????
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberJoinAction.me")) { // ????????????
	
			action = new MemberJoinAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberListAction.me")) { // ?????????
			action = new MemberListAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberViewAction.me")) { // ?????????
			action = new MemberViewAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberDeleteAction.me")) { // ?????? ??????
			action = new MemberDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberUpdateAction.me")) { // ?????? ??????
			action = new MemberUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		} else if (command.equals("/memberFindId.me")) { // ????????? ??????
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/member/findIdForm.jsp");

		} else if (command.equals("/memberFindPw.me")) { // ???????????? ??????
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/member/findPwForm.jsp");

		} else if (command.equals("/memberFindIdAction.me")) {// ????????? ??????
			action = new MemberFindIdAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		 }else if(command.equals("/memberFindPwAction.me")){ // ???????????? ??????
	         action = new MemberFindPwAction();
	         try{
	            forward=action.execute(request, response);
	         }catch(Exception e){
	            e.printStackTrace();
	         }
		}else if(command.equals("/memberlogout.me")){ 
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/member/logout.jsp");
		}else if(command.equals("/member_info.me")){ 
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/member/member_info.jsp");
			
		}else if(command.equals("/ProfessorInsertForm.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/professor/ProfessorInsert_form.jsp");
		}else if(command.equals("/ProfessorInsert.me")) {
			action = new ProfessorInsertAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/ProfessorListManager.me")) {
			action = new ProfessorListManagerAction();
			try {
				forward = action.execute(request,response);
			} catch (Exception e) {
				e.printStackTrace();			
			}
		}
		
		else if(command.equals("/ProfessorListClient.me")) {
				action = new ProfessorListClientAction();
				try {
					forward = action.execute(request,response);
				} catch (Exception e) {
					e.printStackTrace();			
				}
			}
		
		else if(command.equals("/ProfessorDelete.me")) {
			action = new ProfessorDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/ProfessorUpdateForm.me")) {
			action = new ProfessorUpdateFormAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		else if(command.equals("/ProfessorUpdate.me")) {
			action = new ProfessorUpdateAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if(command.equals("/registList.me")){ // ????????????
			action = new RegistListAction();
			try{
				forward=action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}

		else if (command.equals("/RegistDelete.me")) { // ?????? ??????
			action = new RegistDeleteAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		else if (command.equals("/memberListAction.me")) { // ?????????
	         action = new MemberListAction();
	         try {
	            forward = action.execute(request, response);
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
	      } else if (command.equals("/memberDeleteAction.me")) { // ?????? ??????,??????
	         action = new MemberDeleteAction();
	         try {
	            forward = action.execute(request, response);
	         } catch (Exception e) {
	            e.printStackTrace();
	         }
		
	      }
	      else if (command.equals("/RegistInsert.me")) { // ?????? ??????
		         action = new RegistInsertAction();
		         try {
		            forward = action.execute(request, response);
		         } catch (Exception e) {
		            e.printStackTrace();
		         }
			
		      }else if(command.equals("/index.me")) {
					action = new IndexAction();
					try {
						forward = action.execute(request, response);
					} catch (Exception e) {
						e.printStackTrace();
					}
				}
				
				
			else if(command.equals("/review_list.me")) {
				action = new ReviewListAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
				//?????? ??????????????? ?????? ?????? ?????????
			else if(command.equals("/review_write.me")) {
				forward = new ActionForward();
				forward.setPath("/review/review_write.jsp");
			}
				
				//?????? ?????? ????????? ??????
			else if(command.equals("/reviewWrite.me")) {
				action = new ReviewWriteAction();
				try {
					forward = action.execute(request,  response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
				
				//?????? ??????????????? ?????? ????????????
			else if(command.equals("/reviewModifyGo.me")) {
				action = new ReviewModifyGoAction();
				try {
					forward = action.execute(request,  response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
				
				//?????? ?????? ????????? ??????
			else if(command.equals("/reviewModify.me")) {
				action = new ReviewModifyAction();
				try {
					forward = action.execute(request,  response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
				
				//?????? ??????????????? ?????? ??????
			else if(command.equals("/reviewDelete.me" )) {
				action = new ReviewDeleteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
				//[?????? ?????? ??????]?????? [?????? ?????? ?????? ???]?????? [220926 ??????]
			else if(command.equals("/all_review_write.me")) {
				forward = new ActionForward();
				forward.setPath("/review/all_review_write.jsp");
			}
				//[?????? ?????? ?????? ???]?????? ?????? ?????? [20220926 ??????]
			else if(command.equals("/allReviewWrite.me")) {
				action = new AllReviewWriteAction();
				try {
					forward = action.execute(request,  response);
				} catch (Exception e) {
					e.printStackTrace();
				}
				}
				//[?????? ?????? ?????? ???]?????? ?????? ??? [?????? ?????? ?????? ?????? ?????????]??? [220926 ??????]
			else if(command.equals("/all_review_write_success.me")) {
				forward = new ActionForward();
				forward.setPath("/review/all_review_write_success.jsp");
			}

				//[?????? ?????? ?????????]?????? [?????? ?????? ?????? ?????????]??? [220926 ??????]
			else if(command.equals("/all_review_list.me")) {
				action = new AllReviewListAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
				
				//[?????? ?????? ?????????]?????? ?????? ?????? [220926 ??????]
			else if(command.equals("/allReviewDelete.me" )) {
				action = new AllReviewDeleteAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
				//[?????? ?????? ?????????]?????? ?????? ?????? [220926 ??????]
			else if(command.equals("/allReviewSend.me" )) {
				action = new AllReviewSendAction();
				try {
					forward = action.execute(request, response);
				} catch (Exception e) {
					e.printStackTrace();
				}
	}
		
		
			
			else if(command.equals("/introduce.me")){//?????????
				forward=new ActionForward();
				forward.setPath("/introduce.jsp");
				
			}
	 
		
		if(forward != null){
			
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
						request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);
			}
			
		}
		
	}
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
	
}