package action;

import java.io.PrintWriter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import svc.BoardModifyProService;
import vo.ActionForward;
import vo.MovieBean;

public class BoardModifyProAction implements Action {

	 public ActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception{
	
		ActionForward forward = null;
		boolean isModifySuccess = false;
		int board_num=Integer.parseInt(request.getParameter("board_num"));
		
		//
		String boardtype = request.getParameter("MOVIE_GENRE");
		
		MovieBean article = new MovieBean();
		BoardModifyProService boardModifyProService = new BoardModifyProService();
		boolean isRightUser=boardModifyProService.isArticleWriter(board_num);
		
		System.out.println("isRightUser: " + isRightUser);

		if(!isRightUser){
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out=response.getWriter();
			out.println("<script>");
			out.println("alert('������ ������ �����ϴ�.');");
			out.println("history.back();");
			out.println("</script>");
		}
		else{
			article.setMOVIE_NUM(board_num);
			article.setMOVIE_SUBJECT(request.getParameter("MOVIE_SUBJECT"));
			article.setMOVIE_CONTENT(request.getParameter("MOVIE_CONTENT"));

			isModifySuccess = boardModifyProService.modifyArticle(article, boardtype);

			if(!isModifySuccess){
				response.setContentType("text/html;charset=UTF-8");
				PrintWriter out=response.getWriter();
				out.println("<script>");
				out.println("alert('��������');");
				out.println("history.back()");
				out.println("</script>");
			}
			else{
				System.out.println("�۹�ȣ : "  + article.getMOVIE_NUM());
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath("boardDetail.bo?boardtype=" +boardtype+ "&board_num="+article.getMOVIE_NUM()); 
			}

		}

		return forward;
	}

}