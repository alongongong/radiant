package order.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class CartOrderPayService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		
		int i = Integer.parseInt(request.getParameter("i"));
		
		int[] cart_id = new int[i];
		
		for(int j=0; j<i; j++) {
			cart_id[j] = Integer.parseInt(request.getParameter("cart_id"+j));
		} // for
		
		
		if(memId == null) {
			return "/member/loginForm.do";
			
		} else {
			request.setAttribute("cart_id", cart_id);
			request.setAttribute("i", i);
			
			return "/order/cartOrderPay.jsp";
		} // if
	}

}
