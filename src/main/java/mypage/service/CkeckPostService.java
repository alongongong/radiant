package mypage.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import mypage.bean.ZipcodeDTO;
import mypage.dao.ShipDAO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class CkeckPostService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String sido = request.getParameter("sido");
		String sigungu = request.getParameter("sigungu");
		String roadname = request.getParameter("roadname");
		
		// DB
		List<ZipcodeDTO> list = null;
		if(sido != null && roadname != null) {
			ShipDAO shipDAO = ShipDAO.getInstance();
			list = shipDAO.getZipcodeList(sido, sigungu, roadname);
		}
		
		JSONObject json = new JSONObject();
		if(list != null) {
			JSONArray array = new JSONArray();
			
			for(ZipcodeDTO zipcodeDTO : list) {
				
			}
		}
		return null;
	}

}
