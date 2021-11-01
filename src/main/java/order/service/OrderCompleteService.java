package order.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class OrderCompleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {

		
		System.out.println("여기서 실질적인 결제가 이루어 집니다");
		return "/order/orderComplete.jsp";
	}

}
