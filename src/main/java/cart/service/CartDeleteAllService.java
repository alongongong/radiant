package cart.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import cart.dao.CartDAO;

public class CartDeleteAllService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String userid = request.getParameter("userid");
		
		//DB
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.deleteAll(userid);
		
		return "/cart/cartAllDelete.jsp";
	}

}
