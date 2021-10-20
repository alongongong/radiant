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

		
		
		// DB
		CommentDAO commentDAO = CommentDAO.getInstance();
//		commentDAO.commentWrite(commentDTO);
		List<CommentDTO> commentList = commentDAO.commentList();
		
		return "/board/qnaView.jsp";
	}

}
