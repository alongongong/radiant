package mypage.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import mypage.bean.ShipDTO;
import mypage.dao.ShipDAO;

public class ShipUpdateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("memId");
		String shipName = request.getParameter("shipName");
		String shipZipcode = request.getParameter("shipZipcode");
		String shipAddr1 = request.getParameter("shipAddr1");
		String shipAddr2 = request.getParameter("shipAddr2");
		String receiver = request.getParameter("shipReceiver");
		String shipTel1 = request.getParameter("shipTel1");
		String shipTel2 = request.getParameter("shipTel2");
		String shipTel3 = request.getParameter("shipTel3");
		String baseShipCheck = request.getParameter("baseShipYN");
		
		ShipDTO shipDTO = new ShipDTO();
		shipDTO.setId(id);
		shipDTO.setShipName(shipName);
		shipDTO.setShipZipcode(shipZipcode);
		shipDTO.setShipAddr1(shipAddr1);
		shipDTO.setShipAddr2(shipAddr2);
		shipDTO.setReceiver(receiver);
		shipDTO.setShipTel1(shipTel1);
		shipDTO.setShipTel2(shipTel2);
		shipDTO.setShipTel3(shipTel3);
		shipDTO.setBaseShipCheck(baseShipCheck);
		
		ShipDAO shipDAO = ShipDAO.getInstance();
		shipDAO.updateShip(shipDTO);
		return "/board/commentDelete.jsp";
	}

}
