package order.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import order.bean.OrderDTO;
import order.bean.OrderHistoryDTO;

public class OrderDAO {
	private static OrderDAO instance;
	private SqlSessionFactory sqlSessionFactory;
	
	public static OrderDAO getInstance() {
		synchronized (OrderDAO.class) {
			if(instance == null) {
				instance = new OrderDAO();
			}
		}
		return instance;
	} // getInstance()
	
	public OrderDAO() {
		try {
			Reader reader = Resources.getResourceAsReader("radiant-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		}
	} // 생성자

	public void payInfo(OrderDTO orderDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("orderSQL.payInfo", orderDTO);
		sqlSession.commit();
		sqlSession.close();		
	} // payInfo()

	public void payProduct(OrderDTO orderDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("orderSQL.payProduct", orderDTO);
		sqlSession.commit();
		sqlSession.close();
	} // payProduct()

	public void payDelivery() {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("orderSQL.payDelivery");
		sqlSession.commit();
		sqlSession.close();		
	} // payDelivery()
	
	public List<OrderHistoryDTO> getOrderHistory(String id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		System.out.println("id = " + id);
		List<OrderHistoryDTO> list = sqlSession.selectList("orderSQL.getOrderHistory", id);
		sqlSession.close();
		return list;
		
	} // getOrderHistory()
	
	
	
}
