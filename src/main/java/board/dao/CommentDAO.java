package board.dao;

import java.io.IOException;
import java.io.Reader;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import board.bean.CommentDTO;

public class CommentDAO {
	private static CommentDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	// 싱글톤
	public static CommentDAO getInstance() {
		if(instance == null) {
			synchronized (CommentDAO.class) {
				instance = new CommentDAO();		
			}
		} // if
		
		return instance;
	} // getInstance();
	
	public CommentDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("radiant-config.xml");
			
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	} // 생성자

	public void commentWrite(CommentDTO commentDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("commentSQL.commentWrite", commentDTO);
		sqlSession.commit();
		sqlSession.close();
	}

	public List<CommentDTO> commentList() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<CommentDTO> commentList = sqlSession.selectList("commentSQL.commentList");
		sqlSession.close();
		return commentList;
	}

	public int getCommentSeq(CommentDTO commentDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		int commentSeq = sqlSession.selectOne("commentSQL.getCommentSeq", commentDTO);
		sqlSession.close();
		return commentSeq;
	}

	public void commentDelete(int commentSeq) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("commentSQL.commentDelete", commentSeq);
		sqlSession.commit();
		sqlSession.close();		
	}

	public void commentUpdate(CommentDTO commentDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("commentSQL.commentUpdate", commentDTO);
		sqlSession.commit();
		sqlSession.close();
	}

}
