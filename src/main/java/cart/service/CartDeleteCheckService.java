package cart.service;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import cart.dao.CartDAO;

public class CartDeleteCheckService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		int length = Integer.parseInt(request.getParameter("length"));
		String[] valueArr = request.getParameterValues("valueArr");

		System.out.println();
		
		CartDAO cartDAO = CartDAO.getInstance();
		
		
		for(int i = 0; i<valueArr.length; i++) {
			System.out.println("valueArr["+i+"]"+valueArr[i]); 
			cartDAO.delete(Integer.parseInt(valueArr[i]));
		}
	
		return "/cart/cartDelete.jsp";
	}

}
