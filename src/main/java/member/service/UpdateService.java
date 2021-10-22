package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class UpdateService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		// 데이터
		String id = request.getParameter("updateId");
		String tel1 = request.getParameter("updateTel1");
		String tel2 = request.getParameter("updateTel2");
		String tel3 = request.getParameter("updateTel3");
		String email1 = request.getParameter("updateEmail1");
		String email2 = request.getParameter("updateEmail2");
		String emailTF = request.getParameter("updateEmailTF");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setId(id);
		memberDTO.setTel1(tel1);
		memberDTO.setTel2(tel2);
		memberDTO.setTel3(tel3);
		memberDTO.setEmail1(email1);
		memberDTO.setEmail2(email2);
		memberDTO.setEmailTF(emailTF);
		
		// DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		memberDAO.update(memberDTO);
		
		return "/member/updateForm.do";
	}

}
