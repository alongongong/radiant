package mypage.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mypage.bean.ShipDTO;

public class ShipDAO {
	private static ShipDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public static ShipDAO getInstance() {
		if(instance == null) {
			synchronized (ShipDAO.class) {
				instance = new ShipDAO();
			}
		}
		return instance;
	} // getInstance()
	
	public ShipDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("radiant-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	} // 생성자	

	public void addShip(ShipDTO shipDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("shipSQL.addShip", shipDTO);
		sqlSession.commit();
		sqlSession.close();
	} // addShip()
}
