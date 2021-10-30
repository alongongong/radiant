package main.service;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.control.CommandProcess;

import staticFile.StaticFile;

public class IndexService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		String[] fileList = StaticFile.path.list();
		
		request.setAttribute("fileList", fileList);
		
		return "/index.jsp";
	}

}


