package stock.dao;

import java.io.IOException;
import java.io.Reader;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import stock.bean.StockDTO;

public class StockDAO {


  private static StockDAO instance;
  private SqlSessionFactory sqlSessionFactory;

  // 싱글톤
  public static StockDAO getInstance() {
    if (instance == null) {
      synchronized (StockDAO.class) {
        instance = new StockDAO();
      }
    } // if

    return instance;
  } // getInstance();

  public StockDAO() {
    try {
      Reader reader = Resources.getResourceAsReader("radiant-config.xml");

      sqlSessionFactory = new SqlSessionFactoryBuilder().build(reader);
    } catch (IOException e) {
      // TODO Auto-generated catch block
      e.printStackTrace();
    }
  } // 생성자

  public void write(StockDTO stockDTO) {

    SqlSession sqlSession = sqlSessionFactory.openSession();

    String seq = null;
    if (stockDTO.getCategory().equals("상의")) {
      seq = "seq_radianttop";
    } else if (stockDTO.getCategory().equals("하의")) {
      seq = "seq_radiantpants";
    } else if (stockDTO.getCategory().equals("아우터")) {
      seq = "seq_radiantouter";
    } else {
      System.out.println("카테고리에 이상한 값이 들어있어요");
    }

    Map<String, Object> map = new HashMap<>();
    map.put("seq", seq);
    map.put("stockDTO", stockDTO);
    sqlSession.insert("stockSQL.write", map);

    sqlSession.commit();

    sqlSession.close();

  }

  public List<StockDTO> print() {
    SqlSession sqlSession = sqlSessionFactory.openSession();

    List<StockDTO> list = sqlSession.selectList("stockSQL.print");
    System.out.println(list.size());
    sqlSession.close();

    return list;
  } // print()

  public void update1(StockDTO stockDTO) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    sqlSession.update("stockSQL.update1", stockDTO);
    sqlSession.commit();
    sqlSession.close();
  }

  public void update2(StockDTO stockDTO) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    sqlSession.update("stockSQL.update2", stockDTO);
    sqlSession.commit();
    sqlSession.close();
  }

  public void update3(StockDTO stockDTO) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    sqlSession.update("stockSQL.update3", stockDTO);
    sqlSession.commit();
    sqlSession.close();
  }

  public void delete1(int clNum) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    sqlSession.delete("stockSQL.delete1", clNum);
    sqlSession.commit();
    sqlSession.close();
  }

  public void delete2(int clNum) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    sqlSession.delete("stockSQL.delete2", clNum);
    sqlSession.commit();
    sqlSession.close();
  }

  public void delete3(int clNum) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    sqlSession.delete("stockSQL.delete3", clNum);
    sqlSession.commit();
    sqlSession.close();
  }

  public List<StockDTO> getStockList(String category) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    List<StockDTO> stockList = sqlSession.selectList("stockSQL.getStockList", category);
    sqlSession.close();
    return stockList;
  }

  public List<StockDTO> getClInfoList(int clnum) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    List<StockDTO> clInfoList = sqlSession.selectList("stockSQL.getClInfoList", clnum);
    sqlSession.close();
    return clInfoList;
  }

  public void addOption(int clNum, String color, int enterCount, int outCount) {
    SqlSession sqlSession = sqlSessionFactory.openSession();
    Map<String, Object> map = new HashMap<String, Object>();
    map.put("clNum", clNum);
    map.put("color", color);
    map.put("enterCount", enterCount);
    map.put("outCount", outCount);

    sqlSession.insert("addOption", map);
    sqlSession.commit();
    sqlSession.close();
  }


}
