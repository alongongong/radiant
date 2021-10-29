package order.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class OrderPayService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String mainFileList = request.getParameter("mainFileList");
		int product_id = Integer.parseInt(mainFileList.substring(0, mainFileList.lastIndexOf(".")));
		String color = request.getParameter("color");
		
		request.setAttribute("product_id", product_id);
		request.setAttribute("color", color);
		
		return "/order/orderPay.jsp";
	}

}
