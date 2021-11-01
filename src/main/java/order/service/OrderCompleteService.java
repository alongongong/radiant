package order.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class OrderCompleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
//		// 데이터
//		int i = Integer.parseInt(request.getParameter("i"));
//		int[] clNum = new int[i];
//		String[] color = new String[i];
//		int[] outCount = new int[i];
//		
//		for(int j=0; j<i; j++) {
//			clNum[j] = Integer.parseInt(request.getParameter("clNum"+j));
//			color[j] = request.getParameter("color"+j);
//			outCount[j] = Integer.parseInt(request.getParameter("productAmount"+j));
//			
//			System.out.println("clNum["+j+"]="+clNum[j]);
//			System.out.println("color["+j+"]="+color[j]);
//			System.out.println("outCount["+j+"]="+outCount[j]);
//		}
//		
//		int shipMoney = Integer.parseInt(request.getParameter("hiddenShipMoney"));
//		int saved = Integer.parseInt(request.getParameter("saved"));
//		String tel1 = request.getParameter("userInfoTel1");
//		String tel2 = request.getParameter("userInfoTel2");
//		String tel3 = request.getParameter("userInfoTel3");
//		String email = request.getParameter("userInfoEmail");
//		String email1 = email.substring(0, email.indexOf("@"));
//		String email2 = email.substring(email.indexOf("@")+1);
//		String shipName = request.getParameter("shipName");
//		String shipTel1 = request.getParameter("shipTel1");
//		String shipTel2 = request.getParameter("shipTel2");
//		String shipTel3 = request.getParameter("shipTel3");
//		String shipZipcode = request.getParameter("shipZipcode");
//		String shipAddr1 = request.getParameter("shipAddr1");
//		String shipAddr2 = request.getParameter("shipAddr2");
//		String shipMemo = request.getParameter("shipMemo");
//		String payment = request.getParameter("paymentCheck"); 
//		
//		
//		System.out.println("i="+i);
//		System.out.println("shipMoney="+shipMoney);
//		System.out.println("saved="+saved);
//		System.out.println("payment="+payment);
		
		System.out.println("여기서 실질적인 결제가 이루어 집니다");
		return "/order/orderComplete.jsp";
	}

}
