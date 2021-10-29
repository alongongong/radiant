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
import stock.dao.StockDAO;


public class CartInsertService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//로그인 여부를 체크하기 위해 세션에 저장된 아이디 확인
		request.setCharacterEncoding("UTF-8");
		HttpSession session = request.getSession();
		String userid = (String)session.getAttribute("memId");
		String mainFileList = request.getParameter("mainFileList");
		int product_id = Integer.parseInt(mainFileList.substring(0, mainFileList.lastIndexOf(".")));
		String color = request.getParameter("select-color");
		
		System.out.println(color);
		
		StockDTO stockDTO = new StockDTO();
		stockDTO.setColor(color);
		stockDTO.setClNum(product_id);
		
		StockDAO stockDAO =StockDAO.getInstance();
		stockDTO = stockDAO.getStockDTO(stockDTO);
		

	
		File path = new File("D:/java_ee/workspace/radiant/src/main/webapp/img/clothes");//현정
		String[] fileList = path.list();

		
	
		
		if(userid==null) {//로그인하지 않은 상태이면 로그인 화면으로 이동
			return "/member/loginForm.do";
		}	
			
		CartDTO cartDTO = new CartDTO();
		cartDTO.setUserid(userid);
		cartDTO.setAmount(1); //아직 안함 - 수량
		cartDTO.setProduct_id(product_id); //clnum
		
		cartDTO.setProduct_name(stockDTO.getClName());
		cartDTO.setPrice(stockDTO.getPrice());
		 
		
		CartDAO cartDAO = CartDAO.getInstance();
		
		Integer count = cartDAO.checkCart(cartDTO);
		
		if(count == 0) {
			cartDAO.insert(cartDTO);//장바구니 테이블에 저장됨
		}
		
		List<CartDTO> cartlist = cartDAO.cartList(userid);
		
		for(String data : fileList) {
			int temp = Integer.parseInt(data.substring(0, data.lastIndexOf(".")));
			
			for(CartDTO data2 : cartlist) {
				if(data2.getProduct_id() == temp) {
					data2.setImg(data);
					
				}
			
				
			}
		}
		
		
		
		
		
		request.setAttribute("cartlist", cartlist);
		request.setAttribute("mainFileList", mainFileList);

		
		return "/cart/cart.jsp"; //장바구니 목록으로 이동됨 
		
	}
	


}
