package mainNav.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import stock.bean.StockDTO;
import stock.dao.StockDAO;

public class PantsService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		//File path = new File("C:/java__ee/workspace/radiant/src/main/webapp/img/clothes"); //건휘
		File path = new File("C:/java__ee/workspace/radiant/src/main/webapp/img/clothes"); //아라
		//File path = new File("D:/java_ee/workspace/radiant/src/main/webapp/img/clothes");//현정

		String[] fileList = path.list();
		List<String> list = new ArrayList<String>();
		
		for(String data : fileList) {
			int temp = Integer.parseInt(data.substring(0, data.lastIndexOf(".")));
			System.out.println("temp = " + temp);
			if(temp > 200 && temp < 300) {
				list.add(data);
			}
		}
		
		// DB
		StockDAO stockDAO = StockDAO.getInstance();
		List<StockDTO> stockList = stockDAO.getStockList("하의");
		
		
//		for (int i = 0; i < fileList.length; i++) {
//		    System.out.println("file: " + fileList[i]);
//		}
		request.setAttribute("list", list);
		request.setAttribute("stockList", stockList);
		
		return "/mainNav/pants.jsp";
	}

}
