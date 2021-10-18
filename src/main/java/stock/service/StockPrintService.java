package stock.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import stock.bean.StockDTO;
import stock.dao.StockDAO;

public class StockPrintService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		
		StockDAO stockDAO = StockDAO.getInstance();
		StockDTO stockDTO = new StockDTO();
		
		List<StockDTO> list = stockDAO.print();
		
		request.setAttribute("list", list);		
		
		return "/stock/stockPrint.jsp";
	}

}
