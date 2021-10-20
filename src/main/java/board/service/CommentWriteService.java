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
		int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
		String commentText = request.getParameter("commentText"+boardSeq);
		CommentDTO commentDTO = new CommentDTO();
		commentDTO.setCommentId(commentId);
		commentDTO.setCommentText(commentText);
		commentDTO.setBoardSeq(boardSeq);
		
		System.out.println("확인");
		System.out.println(commentId);
		System.out.println(boardSeq);
		System.out.println(commentText);
		System.out.println("-------------------------------");
		System.out.println();
		
		// DB
		CommentDAO commentDAO = CommentDAO.getInstance();
		commentDAO.commentWrite(commentDTO);
		
//		String commentReturn = "commentId="+commentId+"&commentText="+commentText+"boardSeq="+boardSeq; 
//		return commentReturn;
		
//		return "/radiant/board/qnaList.do?pg=1";
		
		return "OK";
	}

}
