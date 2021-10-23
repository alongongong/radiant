package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class CheckPhoneService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		//데이터
		String tel1=request.getParameter("tel1");
		String tel2=request.getParameter("tel2");
		String tel3=request.getParameter("tel3");
		System.out.println("================my phone number222============ : "+tel1+tel2+tel3);
		
		
		MemberDAO memberDAO = MemberDAO.getInstance();
		MemberDTO memberDTO = memberDAO.isCheckPhone(tel1,tel2,tel3);
		
		
		if(memberDTO != null) {
			return "/member/checkFailPhone.jsp";
		}else {
			return "/member/checkOkPhone.jsp";
		}
	}
}
