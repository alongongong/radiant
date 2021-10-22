package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.dao.BoardDAO;

public class QnaDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
		
		// DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.qnaDelete(boardSeq);
		
		return "/board/qnaDelete.jsp";
	}

}
