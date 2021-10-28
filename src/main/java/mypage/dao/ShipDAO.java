package mypage.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import mypage.bean.ShipDTO;
import mypage.bean.ZipcodeDTO;

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

	public List<ZipcodeDTO> getZipcodeList(String sido, String sigungu, String roadname) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("sido", sido);
		map.put("sigungu", sigungu);
		map.put("roadname", roadname);
		
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<ZipcodeDTO> list = sqlSession.selectList("shipSQL.getZipcodeList", map);
		sqlSession.close();
		return list;
	} // getZipcodeList()

	public List<ShipDTO> getShipList(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<ShipDTO> list = sqlSession.selectList("shipSQL.getShipList", id);
		sqlSession.close();		
		return list;
	} // getShipList()
	
	public void shipDelete(String shipName) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("shipDelete", shipName);
		sqlSession.commit();
		sqlSession.close();
	}
}
