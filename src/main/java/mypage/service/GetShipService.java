package mypage.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import mypage.bean.ShipDTO;
import mypage.dao.ShipDAO;
import net.sf.json.JSONObject;

public class GetShipService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String shipName = request.getParameter("shipName");
		System.out.println("shipName= " + shipName);
		System.out.println("GetShip DB전");
		ShipDAO shipDAO = ShipDAO.getInstance();
		ShipDTO shipDTO = shipDAO.getShip(shipName);
		System.out.println("GetShip DB후");
		
		JSONObject json = new JSONObject();
		json.put("id", shipDTO.getId());
		json.put("shipName", shipDTO.getShipName());
		json.put("shipZipcode", shipDTO.getShipZipcode());
		json.put("shipAddr1", shipDTO.getShipAddr1());
		json.put("shipAddr2", shipDTO.getShipAddr2());
		json.put("receiver", shipDTO.getReceiver());
		json.put("shipTel1", shipDTO.getShipTel1());
		json.put("shipTel2", shipDTO.getShipTel2());
		json.put("shipTel3", shipDTO.getShipTel3());
		json.put("baseShipCheck", shipDTO.getBaseShipCheck());
		
		request.setAttribute("json", json);
		return "/mypage/getShip.jsp";
	}

}
