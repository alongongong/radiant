package mypage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import mypage.bean.ShipDTO;
import mypage.dao.ShipDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class ManageShipPrintService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		
		// DB
		ShipDAO shipDAO = ShipDAO.getInstance();
		List<ShipDTO> list = shipDAO.getShipList(id);
		
		JSONObject json = new JSONObject();
		
		if(list != null) {
			JSONArray array = new JSONArray();
			for(ShipDTO shipDTO : list) {
				JSONObject temp = new JSONObject();
				temp.put("id", shipDTO.getId());
				temp.put("shipName", shipDTO.getShipName());
				temp.put("shipZipcode", shipDTO.getShipZipcode());
				temp.put("shipAddr1", shipDTO.getShipAddr1());
				temp.put("shipAddr2", shipDTO.getShipAddr2());
				temp.put("receiver", shipDTO.getReceiver());
				temp.put("shipTel1", shipDTO.getShipTel1());
				temp.put("shipTel2", shipDTO.getShipTel2());
				temp.put("shipTel3", shipDTO.getShipTel3());
				temp.put("baseShipCheck", shipDTO.getBaseShipCheck());
				
				array.add(temp);
			} // for
			
			json.put("list", array);
		}
		request.setAttribute("list", json);
		
		return "/mypage/checkPost.jsp";
		// ${list}가 있는 jsp라서 여기로 이동.
	}

}
