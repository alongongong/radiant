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

import board.bean.BoardDTO;

public class BoardDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy.MM.dd");
	
	private static BoardDAO instance;
	
	public static BoardDAO getInstance() {
		if(instance == null) {
			synchronized (BoardDAO.class) {
				instance = new BoardDAO();
			}
		}
		return instance;
	} // getInstance()
	
	public BoardDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	} // 생성자
	
	public void qnaWrite(BoardDTO boardDTO) {
		String sql = "insert into radiantboard(boardseq, id, subject, content) "
				+ "values(seq_radiantboard.nextval,?,?,?)";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, boardDTO.getId());
			pstmt.setString(2, boardDTO.getSubject());
			pstmt.setString(3, boardDTO.getContent());
			
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
	} // qnaWrite()
	
	public List<BoardDTO> qnaList(int startNum, int endNum) {
		List<BoardDTO> list = new ArrayList<BoardDTO>();
		
		String sql = "select * from "
				+ "(select rownum rn, tt.* from "
				+ "(select * from radiantboard order by boardseq desc) tt) "
				+ "where rn>=? and rn<=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,startNum);
			pstmt.setInt(2, endNum);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				BoardDTO boardDTO = new BoardDTO();
				boardDTO.setBoardSeq(rs.getInt("boardseq"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content").replace("\n", "<br>").replace(" ","&emsp;"));
				boardDTO.setReply(rs.getInt("reply"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(sdf.format(rs.getDate("logtime")));
				list.add(boardDTO);
			} // while
		} catch (SQLException e) {
			e.printStackTrace();
			list = null;
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	} // qnaList()

	public int getTotalA() {
		int totalA = 0;
		String sql = "select count(*) from radiantboard";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				totalA = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return totalA;
	} // getTotalA()

	public BoardDTO qnaView(int seq) {
		BoardDTO boardDTO = null;
		
		String sql = "select * from radiantboard where seq=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, seq);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				boardDTO = new BoardDTO();
				boardDTO.setBoardSeq(rs.getInt("boardseq"));
				boardDTO.setId(rs.getString("id"));
				boardDTO.setSubject(rs.getString("subject"));
				boardDTO.setContent(rs.getString("content"));
				boardDTO.setReply(rs.getInt("reply"));
				boardDTO.setHit(rs.getInt("hit"));
				boardDTO.setLogtime(sdf.format(rs.getDate("logtime")));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs !=null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return boardDTO;
	} // qnaView()

}
