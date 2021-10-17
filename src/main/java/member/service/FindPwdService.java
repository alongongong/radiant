package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class FindPwdService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String id = request.getParameter("findPwdId");
		String name = request.getParameter("findPwdName");
		String tel1 = request.getParameter("findPwdTel1");
		String tel2 = request.getParameter("findPwdTel2");
		String tel3 = request.getParameter("findPwdTel3");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(id);
		memberDTO.setName(name);
		memberDTO.setTel1(tel1);
		memberDTO.setTel2(tel2);
		memberDTO.setTel3(tel3);
		
		// DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		boolean exist = memberDAO.getFindPwd(memberDTO);
		
		if(exist) {
			return "/member/changePwdForm.jsp";
		} else {
			return "";
		}
	}

}
