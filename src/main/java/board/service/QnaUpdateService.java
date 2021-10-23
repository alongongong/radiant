package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class QnaUpdateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		// 데이터
		int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
		String subject = request.getParameter("qnaSubject");
		String content = request.getParameter("qnaContent");
		BoardDTO boardDTO = new BoardDTO();
		boardDTO.setBoardSeq(boardSeq);
		boardDTO.setSubject(subject);
		boardDTO.setContent(content);
		
		// DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		boardDAO.qnaUpdate(boardDTO);
		
		// 응답
		return "/board/qnaUpdate.jsp";
	}

}
