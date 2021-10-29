package order.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import net.sf.json.JSONObject;
import stock.bean.StockDTO;
import stock.dao.StockDAO;

public class GetOrderPayService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		int clNum = Integer.parseInt(request.getParameter("clNum"));
		String color = request.getParameter("color");
		StockDTO stockDTO = new StockDTO();
		stockDTO.setClNum(clNum);
		stockDTO.setColor(color);
		
		// DB
		StockDAO stockDAO = StockDAO.getInstance();
		stockDTO = stockDAO.getStockDTO(stockDTO);
		
		JSONObject json = new JSONObject();
		json.put("clNum", clNum);
		json.put("color", color);
		json.put("clName", stockDTO.getClName());
		json.put("category", stockDTO.getCategory());
		json.put("price", stockDTO.getPrice());
		json.put("salerate", stockDTO.getSalerate());
		json.put("clDetail", stockDTO.getClDetail());

		request.setAttribute("json", json);
		
		return null;
	}

}
