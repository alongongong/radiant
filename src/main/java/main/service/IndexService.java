package main.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.control.CommandProcess;

import staticFile.StaticFile;
import stock.bean.StockDTO;
import stock.dao.StockDAO;


public class IndexService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String[] fileList = StaticFile.path.list();
		
		StockDAO stockDAO = StockDAO.getInstance();
		List<StockDTO> list = stockDAO.radiantInfo();
		
		for(String data : fileList) {
			int temp = Integer.parseInt(data.substring(0, data.lastIndexOf(".")));
			
			for(int i = 0; i < list.size(); i++) {
				if(list.get(i).getClNum() == temp) {
					list.get(i).setImg(data);					
				}
			}
		}

		request.setAttribute("fileList", fileList);
		request.setAttribute("list", list);
		return "/index.jsp";
	}

}


