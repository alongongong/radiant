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
				JSONObject temp = new JSONObject();
				temp.put("zipcode", zipcodeDTO.getZipcode());
				temp.put("sido", zipcodeDTO.getSido());
				temp.put("sigungu", zipcodeDTO.getSigungu());
				temp.put("yubmyundong", zipcodeDTO.getYubmyundong());
				temp.put("ri", zipcodeDTO.getRi());
				temp.put("roadname", zipcodeDTO.getRoadname());
				temp.put("buildingname", zipcodeDTO.getBuildingname());
				
				array.add(temp);
			} // for
			
			json.put("list", array);
		}
		request.setAttribute("list", json);
		
		return "/mypage/checkPost.jsp";
	}

}
