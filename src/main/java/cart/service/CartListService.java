package cart.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import cart.bean.CartDTO;
import cart.dao.CartDAO;

public class CartListService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		/*
		 * CartDAO cartDAO = CartDAO.getInstance(); List<CartDTO> cartlist =
		 * cartDAO.cartList();
		 * System.out.println("==============my log=========="+cartlist.size());
		 * for(CartDTO list : cartlist) { System.out.println(list.getCart_id()); }
		 * 
		 * request.setAttribute("cartlist", cartlist);
		 * 
		 * return "/cart/cart.jsp";
		 */
		return null;
	}
}
