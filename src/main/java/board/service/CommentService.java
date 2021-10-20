package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.CommentDTO;
import board.dao.CommentDAO;

public class CommentService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
//		// 데이터
//		HttpSession session = request.getSession();
//		String commentId = (String) session.getAttribute("memId");
//		String commentText = request.getParameter("commentText");
//		
		// DB
		CommentDAO commentDAO = CommentDAO.getInstance();
//		commentDAO.commentWrite(commentId, commentText);
		List<CommentDTO> commentList = commentDAO.commentList();
		
		return "/board/qnaView.jsp";
	}

}
