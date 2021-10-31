package cart.service;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import cart.bean.CartDTO;
import cart.dao.CartDAO;
import staticFile.StaticFile;
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
		int i = Integer.parseInt(request.getParameter("i"));
		
		String[] color = new String[i];
		int[] outcount = new int[i];
		
		for(int j=0; j<i; j++) {
			color[j] = request.getParameter("color"+j);
			outcount[j] = Integer.parseInt(request.getParameter("outcount" + j));
		} // for
		
		StockDTO stockDTO = new StockDTO();
		stockDTO.setColor(color[0]);
		stockDTO.setClNum(product_id);
		
		StockDAO stockDAO =StockDAO.getInstance();
		stockDTO = stockDAO.getStockDTO(stockDTO);
		


		String[] fileList = StaticFile.path.list();

		
		if(userid==null) {//로그인하지 않은 상태이면 로그인 화면으로 이동
			return "/member/loginForm.do";
		}	
		
		List<CartDTO> list = new ArrayList<CartDTO>();
		CartDAO cartDAO = CartDAO.getInstance();
		for(int j=0; j<i; j++) {
			CartDTO cartDTO = new CartDTO();
			cartDTO.setUserid(userid);
			cartDTO.setAmount(outcount[j]);
			cartDTO.setColor(color[j]);
			cartDTO.setProduct_id(product_id); //clnum
			cartDTO.setProduct_name(stockDTO.getClName());
			cartDTO.setPrice(stockDTO.getPrice());			
			Integer count = cartDAO.checkCart(cartDTO);
			if(count == 0) {
				cartDAO.insert(cartDTO);//장바구니 테이블에 저장됨
			}
		} // for
		 
		List<CartDTO> cartlist = cartDAO.cartList(userid);
		
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
		request.setAttribute("mainFileList", mainFileList);

		
		return "/cart/cart.jsp"; //장바구니 목록으로 이동됨 
		
	}
	


}
