package stock.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import stock.bean.StockDTO;
import stock.dao.StockDAO;

public class StockUpDelService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		int i = Integer.parseInt(request.getParameter("i"));
		String btnName = request.getParameter("btn");
		int clNum = Integer.parseInt(request.getParameter("clNum"+i));
		
		// DB
		StockDAO stockDAO = StockDAO.getInstance();
		
		if(btnName.equals("수정")) {
			String clName = request.getParameter("clName"+i);
			String color = request.getParameter("color"+i);
			String category = request.getParameter("category"+i);
			int price = Integer.parseInt(request.getParameter("price"+i));
			int salerate = Integer.parseInt(request.getParameter("salerate"+i));
			int enterCount = Integer.parseInt(request.getParameter("enterCount"+i));
			int outCount = Integer.parseInt(request.getParameter("outCount"+i));
			String clDetail = request.getParameter("clDetail"+i);
			
			StockDTO stockDTO = new StockDTO();
			
			stockDTO.setClNum(clNum);
			stockDTO.setClName(clName);
			stockDTO.setColor(color);
			stockDTO.setCategory(category);
			stockDTO.setPrice(price);
			stockDTO.setSalerate(salerate);
			stockDTO.setEnterCount(enterCount);
			stockDTO.setOutCount(outCount);
			stockDTO.setClDetail(clDetail);
			stockDAO.update1(stockDTO);
			stockDAO.update2(stockDTO);
			stockDAO.update3(stockDTO);
		} else if(btnName.equals("삭제")) {
			stockDAO.delete1(clNum);
			stockDAO.delete2(clNum);
			stockDAO.delete3(clNum);
		} else {
			System.out.println("잘못됐어..");
		}
		
		
		return "/stock/stockPrint.do";
	}

}
