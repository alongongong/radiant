package stock.service;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.control.CommandProcess;
import stock.bean.StockDTO;
import stock.dao.StockDAO;

public class StockMainFormService implements CommandProcess {

  @Override
  public String requestPro(HttpServletRequest request, HttpServletResponse response)
      throws Throwable {
    // 요청
    String mainFileList = request.getParameter("fileList");


    // 데이터가공(카테고리화)
    System.out.println(mainFileList);

    String fileName = mainFileList;

    // 파일명에서 확장자 분리
    if (mainFileList.indexOf(".") > 0) {
      fileName = mainFileList.substring(0, mainFileList.lastIndexOf("."));
    }
    System.out.println(fileName);

    // 파일명 숫자로변환
    int fileNumber = Integer.parseInt(fileName);

    // 데이터
    StockDAO stockDAO = StockDAO.getInstance();

    List<StockDTO> clInfoList = stockDAO.getClInfoList(fileNumber);


    // forward
    request.setAttribute("mainFileList", mainFileList);
    request.setAttribute("clInfoList", clInfoList);

    return "/stock/stockMainForm.jsp";
  }

}
