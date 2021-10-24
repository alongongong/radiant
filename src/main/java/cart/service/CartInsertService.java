package cart.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import cart.bean.CartDTO;
import cart.dao.CartDAO;


public class CartInsertService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//로그인 여부를 체크하기 위해 세션에 저장된 아이디 확인
		System.out.println("자바클래스파일");
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("memId");
		
		
		
		if(userid==null) {//로그인하지 않은 상태이면 로그인 화면으로 이동
			System.out.println("로그인하지않은상태");
			return "/member/loginForm.do";
		}	
			
		CartDTO cartDTO = new CartDTO();
		cartDTO.setUserid(userid);
		cartDTO.setAmount(0);
		cartDTO.setProduct_id(123);
		
		CartDAO cartDAO = CartDAO.getInstance();
		cartDAO.insert(cartDTO);//장바구니 테이블에 저장됨
		System.out.println("로그인한후");
		return "/cart/cart.jsp"; //장바구니 목록으로 이동됨 
		
	}
	


}
