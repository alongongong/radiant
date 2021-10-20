package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.CommentDTO;
import board.dao.CommentDAO;

public class CommentWriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		HttpSession session = request.getSession();
		String commentId = (String) session.getAttribute("memId");
		String commentText = request.getParameter("commentText");
		int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
		CommentDTO commentDTO = new CommentDTO();
		commentDTO.setCommentId(commentId);
		commentDTO.setCommentText(commentText);
		commentDTO.setBoardSeq(boardSeq);

		// DB
		CommentDAO commentDAO = CommentDAO.getInstance();
		commentDAO.commentWrite(commentDTO);
		
		return null;
	}

}
