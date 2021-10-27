package stock.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import stock.dao.StockDAO;

public class StockOptionService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int clNum = Integer.parseInt(request.getParameter("clNum"));
		String color = request.getParameter("color");
		int enterCount = Integer.parseInt(request.getParameter("enterCount"));
		int outCount = Integer.parseInt(request.getParameter("outCount"));
		
		StockDAO stockdao = StockDAO.getInstance();
		stockdao.addOption(clNum, color, enterCount, outCount);
		
		return "/start.jsp";
	}

}
