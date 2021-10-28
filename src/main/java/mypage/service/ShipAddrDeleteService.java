package mypage.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import mypage.dao.ShipDAO;

public class ShipAddrDeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		String shipName = request.getParameter("shipName");
		
		ShipDAO shipDAO = ShipDAO.getInstance();
		shipDAO.shipDelete(shipName);
		return "/board/commentDelete.jsp";
	}

}
