package mainNav.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import stock.bean.StockDTO;
import stock.dao.StockDAO;

public class AllProductService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

				//File path = new File("C:/java__ee/workspace/radiant/src/main/webapp/img/clothes"); //건휘
				//File path = new File("C:/java__ee/workspace/radiant/src/main/webapp/img/clothes"); //아라
				File path = new File("D:/java_ee/workspace/radiant/src/main/webapp/img/clothes");//현정

				String[] fileList = path.list();
				List<String> topImaList = new ArrayList<String>();
				List<String> pantsImaList = new ArrayList<String>();
				List<String> outerImaList = new ArrayList<String>();
				
				for(String data : fileList) {
					int temp = Integer.parseInt(data.substring(0, data.lastIndexOf(".")));
					System.out.println("temp = " + temp);
					if(temp > 0 && temp < 100) {
						topImaList.add(data);
					}
				}
				for(String data : fileList) {
					int temp = Integer.parseInt(data.substring(0, data.lastIndexOf(".")));
					System.out.println("temp = " + temp);
					if(temp > 200 && temp < 300) {
						pantsImaList.add(data);
					}
				}
				for(String data : fileList) {
					int temp = Integer.parseInt(data.substring(0, data.lastIndexOf(".")));
					System.out.println("temp = " + temp);
					if(temp > 100 && temp < 200) {
						outerImaList.add(data);
					}
				}
				
				// DB
				StockDAO stockDAO = StockDAO.getInstance();
				List<StockDTO> topList = stockDAO.getStockList("상의");
				List<StockDTO> pantsList = stockDAO.getStockList("하의");
				List<StockDTO> outerList = stockDAO.getStockList("아우터");
				
//				for (int i = 0; i < fileList.length; i++) {
//				    System.out.println("file: " + fileList[i]);
//				}
				request.setAttribute("topImaList", topImaList);
				request.setAttribute("pantsImaList", pantsImaList);
				request.setAttribute("outerImaList", outerImaList);
				request.setAttribute("topList", topList);
				request.setAttribute("pantsList", pantsList);
				request.setAttribute("outerList", outerList);
				
				return "/mainNav/allProduct.jsp";
	}

}
