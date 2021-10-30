package order.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

public class OrderPayService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		
		String mainFileList = request.getParameter("mainFileList");
		int clNum = Integer.parseInt(mainFileList.substring(0, mainFileList.lastIndexOf(".")));
		String color = request.getParameter("color");
		
		if(memId == null) {
			return "/member/loginForm.do";
			
		} else {
			request.setAttribute("clNum", clNum);
			request.setAttribute("color", color);
			
			return "/order/orderPay.jsp";
		}
	}

}
