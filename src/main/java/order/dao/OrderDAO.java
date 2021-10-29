package order.dao;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

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
	
	
}
