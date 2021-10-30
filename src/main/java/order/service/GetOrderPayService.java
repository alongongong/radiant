package order.service;

import java.io.File;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import net.sf.json.JSONObject;
import stock.bean.StockDTO;
import stock.dao.StockDAO;

public class GetOrderPayService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		int clNum = Integer.parseInt(request.getParameter("clNum"));
		String color = request.getParameter("color");
		StockDTO stockDTO = new StockDTO();
		stockDTO.setClNum(clNum);
		stockDTO.setColor(color);
		
		// DB
		StockDAO stockDAO = StockDAO.getInstance();
		stockDTO = stockDAO.getStockDTO(stockDTO);
		
		// 사진
		//File path = new File("C:\\Users\\downc\\git\\repository\\radiant\\src\\main\\webapp\\img\\clothes"); //현석님
		File path = new File("C:\\study\\java_ee\\workspace\\radiant\\src\\main\\webapp\\img\\clothes");//아라언니
		//File path = new File("C:\\java__ee\\workspace\\radiant\\src\\main\\webapp\\img\\clothes");
		//File path = new File("D:/java_ee/workspace/radiant/src/main/webapp/img/clothes");//현정
		String[] fileList = path.list();
		
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

		request.setAttribute("list", json);
		
		return "/mypage/checkPost.jsp";
		// ${list}가 있는 jsp라서 여기로 이동.
	}

}
