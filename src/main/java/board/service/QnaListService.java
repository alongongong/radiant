package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import board.bean.CommentDTO;
import board.dao.BoardDAO;
import board.dao.CommentDAO;

public class QnaListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		int pg = Integer.parseInt(request.getParameter("pg"));
		
		// DB
		int endNum = pg*10;
		int startNum = endNum-9;
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		List<BoardDTO> list = boardDAO.qnaList(startNum, endNum);
		
		int totalA = boardDAO.getTotalA(); // 총 게시물 수
		int totalP = (totalA-1)/10 +1; // 페이지 번호
		
		request.setAttribute("list", list);
		request.setAttribute("totalP", totalP);
		request.setAttribute("pg", pg);
		
		// DB
		CommentDAO commentDAO = CommentDAO.getInstance();
		List<CommentDTO> commentList = commentDAO.commentList();
		
		request.setAttribute("commentList", commentList);
				
		
		return "/board/qnaList.jsp";
	}

}
