package cart.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import cart.bean.CartDTO;
import cart.dao.CartDAO;

public class CartAmountService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int amount = Integer.parseInt(request.getParameter("amount"));
		int cart_id = Integer.parseInt(request.getParameter("cart_id"));
		
		
		
		CartDTO cartDTO = new CartDTO();
		cartDTO.setAmount(amount);//수량
		cartDTO.setCart_id(cart_id);
		
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.countupdate(cartDTO);
		
		System.out.println("amount="+amount);
		System.out.println("cart_id="+cart_id);
		
		return "/cart/cart.jsp";
	}

}
