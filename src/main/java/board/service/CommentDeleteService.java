package board.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.CommentDTO;
import board.dao.CommentDAO;

public class CommentDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		int commentSeq = Integer.parseInt(request.getParameter("commentSeq"));
		
		
		// DB
		CommentDAO commentDAO = CommentDAO.getInstance();
		commentDAO.commentDelete(commentSeq);
		
		return "/board/commentDelete.jsp";
	}

}
