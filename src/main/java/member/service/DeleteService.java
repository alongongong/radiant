package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class DeleteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String id = request.getParameter("deleteId");
		String pwd = request.getParameter("deletePwd");
		
		// DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.login(id, pwd);
		
		if(memberDTO == null) {
			return "/member/deleteFail.jsp"; 
		} else {
			memberDAO.delete(id, pwd);
			HttpSession session = request.getSession();
			session.invalidate();
			return "/main/index.do";
		}
	}

}
