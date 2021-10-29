package mypage.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import mypage.bean.ShipDTO;
import mypage.dao.ShipDAO;

public class ShipUpdateFormService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String shipName = request.getParameter("shipName");
		
		request.setAttribute("shipName", shipName);
		return "/mypage/shipUpdateForm.jsp";
	}

}
