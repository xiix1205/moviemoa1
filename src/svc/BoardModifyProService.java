package svc;

import static db.JdbcUtil.*;
import java.sql.Connection;
import vo.BoardBean;
import vo.MovieBean;
import dao.BoardDAO;

public class BoardModifyProService {

	public boolean isArticleWriter(int board_num) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isArticleWriter = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		isArticleWriter = boardDAO.isArticleBoardWriter(board_num);
		close(con);
		return isArticleWriter;
		
	}

	public boolean modifyArticle(MovieBean article, String boardtype) throws Exception {
		// TODO Auto-generated method stub
		
		boolean isModifySuccess = false;
		Connection con = getConnection();
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.setConnection(con);
		int updateCount = boardDAO.updateArticle(article, boardtype);
		
		if(updateCount > 0){
			commit(con);
			isModifySuccess=true;
		}
		else{
			rollback(con);
		}
		
		close(con);
		return isModifySuccess;
		
	}

}
