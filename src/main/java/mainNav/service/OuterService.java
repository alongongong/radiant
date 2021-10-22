package mainNav.service;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

public class OuterService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// File path = new File("C:/java__ee/workspace/radiant/src/main/webapp/img/clothes");
		File path = new File("C:/study/java_ee/workspace/radiant/src/main/webapp/img/clothes");
		String[] fileList = path.list();
		
		List<String> list = new ArrayList<String>();
		
		for(String data : fileList) {
			int temp = Integer.parseInt(data.substring(0, data.lastIndexOf(".")));
			System.out.println("temp = " + temp);
			if(temp > 100 && temp < 200) {
				list.add(data);
			}
		}
		
//		for (int i = 0; i < fileList.length; i++) {
//		    System.out.println("file: " + fileList[i]);
//		}
		request.setAttribute("list", list);
		
		return "/mainNav/outer.jsp";
	}

}
