package board.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import board.bean.CommentDTO;

public class CommentDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	
	private static CommentDAO instance;
	
	public static CommentDAO getInstance() {
		if(instance == null) {
			synchronized (CommentDAO.class) {
				instance = new CommentDAO();
			}
		}
		return instance;
	} // getInstance()
	
	public CommentDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	} // 생성자

	public void commentWrite(String commentId, String commentText) {
				
		String sql = "insert into radiantcomment(commentseq, boardseq, commentId, commenttext) values(seq_radiantcomment.next_val, 1, ?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, commentId);
			pstmt.setString(2, commentText);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

	public List<CommentDTO> commentList() {
		List<CommentDTO> commentList = new ArrayList<CommentDTO>();
		String sql = "select * from radiantcomment";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				CommentDTO commentDTO = new CommentDTO();
				commentDTO.setCommentSeq(rs.getInt("commentseq"));
				commentDTO.setBoardSeq(rs.getInt("boardseq"));
				commentDTO.setCommentId(rs.getString("commentid"));
				commentDTO.setCommentText(rs.getString("commenttext").replace("\n", "<br>"));
				commentDTO.setCommentDate(rs.getDate("commentDate"));
				commentList.add(commentDTO);
			}
		} catch (SQLException e) {
			e.printStackTrace();
			commentList = null;
		}  finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return commentList;
	}
}
