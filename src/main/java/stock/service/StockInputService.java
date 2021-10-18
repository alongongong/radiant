package stock.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import stock.bean.StockDTO;
import stock.dao.StockDAO;

public class StockInputService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String clName = request.getParameter("clName");
		String category = request.getParameter("category");
		int price = Integer.parseInt(request.getParameter("price"));
		int salerate = Integer.parseInt(request.getParameter("salerate"));
		String color = request.getParameter("color");
		int EnterCount = Integer.parseInt(request.getParameter("enterCount"));
		String clDetail = request.getParameter("clDetail");
		
		StockDAO stockDAO = StockDAO.getInstance();
		StockDTO stockDTO = new StockDTO();
		stockDTO.setClName(clName);
		stockDTO.setCategory(category);
		stockDTO.setPrice(price);
		stockDTO.setSalerate(salerate);
		stockDTO.setColor(color);
		stockDTO.setEnterCount(EnterCount);
		stockDTO.setClDetail(clDetail);

		stockDAO.write(stockDTO);
		return "/stock/stockInput.jsp";
	}

}
