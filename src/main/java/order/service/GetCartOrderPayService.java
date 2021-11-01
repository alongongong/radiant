package order.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import cart.bean.CartDTO;
import cart.dao.CartDAO;
import member.bean.MemberDTO;
import member.dao.MemberDAO;
import mypage.bean.ShipDTO;
import mypage.dao.ShipDAO;
import net.sf.json.JSONObject;
import staticFile.StaticFile;
import stock.bean.StockDTO;
import stock.dao.StockDAO;

public class GetCartOrderPayService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		
		int i = Integer.parseInt(request.getParameter("i"));

		String[] cart_id = new String[i];
		for(int j=0; j<i; j++) {
			cart_id[j] = request.getParameter("cart_id"+j);
		}
		
		// DB
		CartDAO cartDAO = CartDAO.getInstance();
		List<CartDTO> cartList = new ArrayList<CartDTO>();
		StockDAO stockDAO = StockDAO.getInstance();
		List<StockDTO> stockList = new ArrayList<StockDTO>();
		for(int j=0; j<i; j++) {
			CartDTO cartDTO = cartDAO.cartPayList(cart_id[j]);
			cartList.add(cartDTO);
			StockDTO stockDTO = new StockDTO();
			stockDTO.setClNum(cartDTO.getProduct_id());
			stockDTO.setColor(cartDTO.getColor());
			stockDTO = stockDAO.getStockDTO(stockDTO);
			cartDTO.setSalerate(stockDTO.getSalerate());
		}
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.getMember(memId);
		
		
		ShipDAO shipDAO = ShipDAO.getInstance();
		List<ShipDTO> shipList = shipDAO.getShipList(memId);
		
		
		String[] fileList = StaticFile.path.list();
		
		for(String data : fileList) {
			int temp = Integer.parseInt(data.substring(0, data.lastIndexOf(".")));

			for(CartDTO cartDTO : cartList) {
				if(temp == cartDTO.getProduct_id()) {
					cartDTO.setImg(data);
				}
			}
		} // for
		
		JSONObject json = new JSONObject();
		json.put("i", i);
		json.put("cartList", cartList);
		json.put("userName", memberDTO.getName());
		json.put("userTel1", memberDTO.getTel1());
		json.put("userTel2", memberDTO.getTel2());
		json.put("userTel3", memberDTO.getTel3());
		json.put("userEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
		json.put("shipList", shipList);

		request.setAttribute("list", json);
		
		return "/mypage/checkPost.jsp";
		// ${list}가 있는 jsp라서 여기로 이동.
	}

}
