package cart.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import cart.bean.CartDTO;



public class CartDAO  {
	
	
	private static CartDAO instance = null;
	private SqlSessionFactory sqlSessionFactory;// 1번 생성(생성자) - mybatis에 접근하기 위해 필요(configuration에 있는 내용 읽어오기)

	public static CartDAO getInstance() {
		if (instance == null) {// 처음 시작할떄만 null
			synchronized (CartDAO.class) {// 동기화
				instance = new CartDAO();
			}
		}
		return instance;
	}

	public CartDAO() {// 생성자 - mybatis-config.xml에 설정한 환경설정을 읽는다(1번) - 참조값은 sqlSessionFactory 가지고 있기
		try {
			Reader reader = Resources.getResourceAsReader("radiant-config.xml");
			sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
		} catch (IOException e) {
			e.printStackTrace();
		} // 이 파일이 기본이다.
			// InputStream inputStream =
			// Resources.getResourceAsStream("mybatis-config.xml");

	}


	public void insert(CartDTO cartDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.insert("cartSQL.insert",cartDTO);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public Integer checkCart(CartDTO cartDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		Integer count = sqlSession.selectOne("cartSQL.checkCart",cartDTO);
		sqlSession.close();
		
		return count;
	}
	
	public List<CartDTO> cartList(String userid){
		SqlSession sqlSession = sqlSessionFactory.openSession();
		List<CartDTO> cartList = sqlSession.selectList("cartSQL.cartList",userid);
		sqlSession.close();
		return cartList;
	}
	
	public CartDTO getUser(Map<String,String> map) {
		CartDTO userDTO = null;

		SqlSession sqlSession = sqlSessionFactory.openSession();
		userDTO = sqlSession.selectOne("userSQL.getUser", map);//그때그때마다 값을 바꾸겠다. <T>
		sqlSession.close();
		return userDTO;
	}
	
	public void delete(int cart_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("cartSQL.delete", cart_id);
		sqlSession.commit();
		sqlSession.close();
	}
	
	public void deleteAll(String userid) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("cartSQL.deleteAll",userid);
		sqlSession.commit();
		sqlSession.close();
	}


	public void countupdate(CartDTO cartDTO) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.update("cartSQL.countupdate",cartDTO);
		sqlSession.commit();
		sqlSession.close();
		
	}

	public CartDTO cartPayList(String cart_id) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		CartDTO cartDTO = sqlSession.selectOne("cartSQL.cartPayList",cart_id);
		sqlSession.close();
		return cartDTO;
	}

	public void deletecheck(String string) {
		SqlSession sqlSession = sqlSessionFactory.openSession();
		sqlSession.delete("cartSQL.delete", string);
		sqlSession.commit();
		sqlSession.close();
		
	}


}