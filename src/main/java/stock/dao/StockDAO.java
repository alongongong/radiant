package stock.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class StockDAO {
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	
	private static StockDAO instance;
	
	// 싱글톤
	public static StockDAO getInstance() {
		if(instance == null) {
			synchronized (StockDAO.class) {
				instance = new StockDAO();		
			}
		} // if
		
		return instance;
	} // getInstance();
	
	public StockDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	} // 생성자
	
	
}
