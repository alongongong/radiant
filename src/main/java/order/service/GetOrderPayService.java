package order.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;
import mypage.bean.ShipDTO;
import mypage.dao.ShipDAO;
import net.sf.json.JSONObject;
import staticFile.StaticFile;
import stock.bean.StockDTO;
import stock.dao.StockDAO;

public class GetOrderPayService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		HttpSession session = request.getSession();
		String memId = (String) session.getAttribute("memId");
		
		int clNum = Integer.parseInt(request.getParameter("clNum"));
		String color = request.getParameter("color");
		int outCount = 2;
		//int outCount = Integer.parseInt(request.getParameter("outCount"));
		StockDTO stockDTO = new StockDTO();
		stockDTO.setClNum(clNum);
		stockDTO.setColor(color);
		
		// DB
		StockDAO stockDAO = StockDAO.getInstance();
		stockDTO = stockDAO.getStockDTO(stockDTO);
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.getMember(memId);
		
		ShipDAO shipDAO = ShipDAO.getInstance();
		List<ShipDTO> list = shipDAO.getShipList(memId);
		
		String[] fileList = StaticFile.path.list();
		
		String img = null;
		
		for(String data : fileList) {
			int temp = Integer.parseInt(data.substring(0, data.lastIndexOf(".")));
			
			if(temp == clNum) {
				img = data;
			}
		} // for
		
		JSONObject json = new JSONObject();
		json.put("clNum", clNum);
		json.put("color", color);
		json.put("clName", stockDTO.getClName());
		json.put("category", stockDTO.getCategory());
		json.put("price", stockDTO.getPrice());
		json.put("salerate", stockDTO.getSalerate());
		json.put("clDetail", stockDTO.getClDetail());
		json.put("img", img);
		json.put("outCount", outCount);
		json.put("userName", memberDTO.getName());
		json.put("userTel1", memberDTO.getTel1());
		json.put("userTel2", memberDTO.getTel2());
		json.put("userTel3", memberDTO.getTel3());
		json.put("userEmail", memberDTO.getEmail1()+"@"+memberDTO.getEmail2());
		json.put("list", list);

		request.setAttribute("list", json);
		
		return "/mypage/checkPost.jsp";
		// ${list}가 있는 jsp라서 여기로 이동.
	}

}
