package board.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import board.bean.CommentDTO;
import board.dao.CommentDAO;

public class CommentUpdateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		int commentSeq = Integer.parseInt(request.getParameter("commentSeq"));
		String commentContent = request.getParameter("commentContent");
		
		CommentDTO commentDTO = new CommentDTO();
		commentDTO.setCommentSeq(commentSeq);
		commentDTO.setCommentText(commentContent);
		
		// DB
		CommentDAO commentDAO = CommentDAO.getInstance();
		commentDAO.commentUpdate(commentDTO);
		
		return "/board/commentDelete.jsp";
	}

}
