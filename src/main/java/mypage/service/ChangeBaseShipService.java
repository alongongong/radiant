package mypage.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import mypage.dao.ShipDAO;

public class ChangeBaseShipService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String shipName = request.getParameter("shipName");
		String newBaseShip = request.getParameter("newBaseShip");
		
		// DB
		ShipDAO shipDAO = ShipDAO.getInstance();
		shipDAO.changeBaseShip1(shipName);
		shipDAO.changeBaseShip2(newBaseShip);
		
		return "/board/commentDelete.jsp";
	}

}
