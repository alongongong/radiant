package main.service;

import java.io.File;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.control.CommandProcess;

public class IndexService implements CommandProcess {

  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response)
      throws Throwable {

    File path =
        new File("C:\\study\\java_ee\\workspace\\radiant\\src\\main\\webapp\\img\\clothes");
    String[] fileList = path.list();

    // for (int i = 0; i < fileList.length; i++) {
    // System.out.println("file: " + fileList[i]);
    // }
    request.setAttribute("fileList", fileList);

    return "/index.jsp";
  }

}


