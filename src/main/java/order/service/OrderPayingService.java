package order.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import order.bean.OrderDTO;
import order.dao.OrderDAO;
import stock.bean.StockDTO;
import stock.dao.StockDAO;

public class OrderPayingService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		
		int i = Integer.parseInt(request.getParameter("i"));
		int[] clNum = new int[i];
		String[] color = new String[i];
		int[] outCount = new int[i];
		
		for(int j=0; j<i; j++) {
			clNum[j] = Integer.parseInt(request.getParameter("clNum"+j));
			color[j] = request.getParameter("color"+j);
			outCount[j] = Integer.parseInt(request.getParameter("productAmount"+j));

		}
		
		int shipMoney = Integer.parseInt(request.getParameter("hiddenShipMoney"));
		int saved = Integer.parseInt(request.getParameter("saved"));
		String tel1 = request.getParameter("userInfoTel1");
		String tel2 = request.getParameter("userInfoTel2");
		String tel3 = request.getParameter("userInfoTel3");
		String email = request.getParameter("userInfoEmail");
		String email1 = email.substring(0, email.indexOf("@"));
		String email2 = email.substring(email.indexOf("@")+1);
		String shipName = request.getParameter("shipName");
		String shipTel1 = request.getParameter("shipTel1");
		String shipTel2 = request.getParameter("shipTel2");
		String shipTel3 = request.getParameter("shipTel3");
		String shipZipcode = request.getParameter("shipZipcode");
		String shipAddr1 = request.getParameter("shipAddr1");
		String shipAddr2 = request.getParameter("shipAddr2");
		String shipMemo = request.getParameter("shipMemo");
		String payment = request.getParameter("paymentCheck"); 
		
		// DB
		StockDAO stockDAO = StockDAO.getInstance();
		StockDTO stockDTO = new StockDTO();
		for(int j=0; j<i; j++) {
			stockDTO.setClNum(clNum[j]);
			stockDTO.setColor(color[j]);
			stockDTO.setOutCount(outCount[j]);
			stockDAO.sellStock(stockDTO);
		} // for
		
		OrderDAO orderDAO = OrderDAO.getInstance();
		OrderDTO orderDTO = new OrderDTO();
		orderDTO.setId(id);
		orderDTO.setShipMoney(shipMoney);
		orderDTO.setShipName(shipName);
		orderDTO.setShipTel1(shipTel1);
		orderDTO.setShipTel2(shipTel2);
		orderDTO.setShipTel3(shipTel3);
		orderDTO.setShipZipcode(shipZipcode);
		orderDTO.setShipAddr1(shipAddr1);
		orderDTO.setShipAddr2(shipAddr2);
		orderDTO.setShipMemo(shipMemo);
		orderDTO.setPayment(payment);
		orderDAO.payInfo(orderDTO);
		orderDAO.payDelivery();
		
		for(int j=0; j<i; j++) {
			orderDTO.setClNum(clNum[j]);
			orderDTO.setColor(color[j]);
			orderDTO.setOutCount(outCount[j]);
			orderDAO.payProduct(orderDTO);
		} // for

		
		return "/board/commentDelete.jsp";
		
	}

}
