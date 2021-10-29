package cart.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import cart.bean.CartDTO;
import cart.dao.CartDAO;

public class CartDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		int cart_id = Integer.parseInt(request.getParameter("cart_id"));
		
		
		//DB
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.delete(cart_id);
		
		return "/cart/cartDelete.jsp";
	}
}
