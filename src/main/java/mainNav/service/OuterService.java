package mainNav.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import staticFile.StaticFile;
import stock.bean.StockDTO;
import stock.dao.StockDAO;

public class OuterService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		String[] fileList = StaticFile.path.list();
		List<String> list = new ArrayList<String>();
		
		for(String data : fileList) {
			int temp = Integer.parseInt(data.substring(0, data.lastIndexOf(".")));
			System.out.println("temp = " + temp);
			if(temp > 100 && temp < 200) {
				list.add(data);
			}
		}
		
		// DB
		StockDAO stockDAO = StockDAO.getInstance();
		List<StockDTO> stockList = stockDAO.getStockList("아우터");
		
		
//		for (int i = 0; i < fileList.length; i++) {
//		    System.out.println("file: " + fileList[i]);
//		}
		request.setAttribute("list", list);
		request.setAttribute("stockList", stockList);
		
		return "/mainNav/outer.jsp";
	}

}
