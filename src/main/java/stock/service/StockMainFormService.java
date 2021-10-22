package stock.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.control.CommandProcess;

public class StockMainFormService implements CommandProcess {

  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response)
      throws Throwable {
    String mainFileList = request.getParameter("fileList");

    request.setAttribute("mainFileList", mainFileList);


    // TODO Auto-generated method stub
    return "/stock/stockMainForm.jsp";
  }

}
