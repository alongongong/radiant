package order.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import board.bean.BoardDTO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import order.bean.OrderHistoryDTO;
import order.dao.OrderDAO;

public class GetOrderService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		List<OrderHistoryDTO> list = orderDAO.getOrderHistory(id);
		
		JSONObject json = new JSONObject();
		if(list != null) {
			JSONArray array = new JSONArray();
			
			for(OrderHistoryDTO orderHistoryDTO : list) {
				JSONObject temp = new JSONObject();
				temp.put("orderNum", orderHistoryDTO.getOrderNum());
				temp.put("clName", orderHistoryDTO.getClName());
				temp.put("color", orderHistoryDTO.getColor());
				temp.put("price", orderHistoryDTO.getPrice());
				temp.put("delivery", orderHistoryDTO.getDelivery());
			
				array.add(temp);
			}//for
			
			json.put("list", array);
			
		}
		
		request.setAttribute("list", json);
		return "/order/getOrder.jsp";
	}

}
