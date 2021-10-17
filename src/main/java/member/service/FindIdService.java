package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class FindIdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String name = request.getParameter("findIdName");
		String tel1 = request.getParameter("findIdTel1");
		String tel2 = request.getParameter("findIdTel2");
		String tel3 = request.getParameter("findIdTel3");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setName(name);
		memberDTO.setTel1(tel1);
		memberDTO.setTel2(tel2);
		memberDTO.setTel3(tel3);
		
		// DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		String id = memberDAO.getFindId(memberDTO);
		
		// 응답
		if(id == null) {
			request.setAttribute("findId", "aa");
			return "/member/findIdPwdFail.jsp";
		} else {
			request.setAttribute("id", id);
			return "/member/findId.jsp";
		}
		
	}

}
