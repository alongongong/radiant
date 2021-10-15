package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class LoginService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		// 데이터
		String id = request.getParameter("loginId");
		String pwd = request.getParameter("loginPwd");
		
		System.out.println(id+" "+pwd);
		
		// DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.login(id, pwd);
		
		// 응답
		if(memberDTO == null) {
			return "/member/loginFail.jsp";
		} else {
			String name = memberDTO.getName();
			String tel1 = memberDTO.getTel1();
			String tel2 = memberDTO.getTel2();
			String tel3 = memberDTO.getTel3();
			String memberGrade = memberDTO.getMemberGrade();
			
			// 세션
			HttpSession session = request.getSession();
			session.setAttribute("memName", name);
			session.setAttribute("memId", id);
			session.setAttribute("memTel1", tel1);
			session.setAttribute("memTel2", tel2);
			session.setAttribute("memTel3", tel3);
			session.setAttribute("memGrade", memberGrade);

			return "/index.jsp";
		} // if		
	}

}
