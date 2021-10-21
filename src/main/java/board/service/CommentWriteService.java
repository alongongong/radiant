package board.service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.CommentDTO;
import board.dao.CommentDAO;

public class CommentWriteService implements CommandProcess {
	int commentSeq=30;
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		HttpSession session = request.getSession();
		String commentId = (String) session.getAttribute("memId");
		int boardSeq = Integer.parseInt(request.getParameter("boardSeq"));
		String commentText = request.getParameter("commentText"+boardSeq);
		
		Date date = new Date();
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String commentDate = sd.format(date);
		
		
		// DB
		CommentDAO commentDAO = CommentDAO.getInstance();
		List boardSeqList = commentDAO.getBoardSeq();
		Iterator it = boardSeqList.iterator();
		while(it.hasNext()) {
			if(it.next().equals(boardSeq+"")) {
				commentSeq = 1;
				break;
			} else {
				commentSeq++;
			}
		}
		
		// 데이터
		CommentDTO commentDTO = new CommentDTO();
		commentDTO.setCommentSeq(commentSeq);
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
		commentDAO.commentWrite(commentDTO);
		
//		String commentReturn = "commentId="+commentId+"&commentText="+commentText+"boardSeq="+boardSeq; 
//		return commentReturn;
		
//		return "/radiant/board/qnaList.do?pg=1";
		
		request.setAttribute("commentSeq", commentSeq);
		request.setAttribute("boardSeq", boardSeq);
		request.setAttribute("commentId", commentId);
		request.setAttribute("commentText", commentText);
		request.setAttribute("commentDate", commentDate);
		
		return "OK";
	}

}
