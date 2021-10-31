package main.service;

import java.io.File;
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
		List<StockDTO> list = stockDAO.print();
		
		request.setAttribute("fileList", fileList);
		request.setAttribute("list", list);
		return "/index.jsp";
	}

}


