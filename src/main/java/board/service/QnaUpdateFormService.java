package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.dao.BoardDAO;

public class QnaUpdateFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
		
		// DB
		BoardDAO boardDAO = BoardDAO.getInstance();
		BoardDTO boardDTO = boardDAO.qnaView(boardSeq);
		
		// 응답
		request.setAttribute("subject", boardDTO.getSubject());
		request.setAttribute("content", boardDTO.getContent());
		request.setAttribute("boardDTO", boardDTO);
		
		return "/board/qnaUpdateForm.jsp";
	}

}
