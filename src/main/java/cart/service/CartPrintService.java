package cart.service;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import cart.bean.CartDTO;
import cart.dao.CartDAO;
import stock.bean.StockDTO;

public class CartPrintService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("memId");


		if(userid==null) {//로그인하지 않은 상태이면 로그인 화면으로 이동
			return "/member/loginForm.do";
		}	
		
		
		CartDAO cartDAO = CartDAO.getInstance();
		

		List<CartDTO> cartlist = cartDAO.cartList(userid);
		
		File path = new File("D:/java_ee/workspace/radiant/src/main/webapp/img/clothes");//현정
		String[] fileList = path.list();
		
		for(String data : fileList) {
			int temp = Integer.parseInt(data.substring(0, data.lastIndexOf(".")));
			
			for(CartDTO data2 : cartlist) {
				if(data2.getProduct_id() == temp) {
					data2.setImg(data);
					
				}
			
				
			}
		}
		
		
		
		
		request.setAttribute("userid", userid);
		request.setAttribute("cartlist", cartlist);

		
		return "/cart/cart.jsp";
	}

}
