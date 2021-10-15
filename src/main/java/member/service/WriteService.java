package member.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.control.CommandProcess;

import member.bean.MemberDTO;
import member.dao.MemberDAO;

public class WriteService implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) throws Throwable {
		
		System.out.println(request.getParameter("writeName"));
		System.out.println(request.getParameter("writeId"));
		System.out.println(request.getParameter("writeId"));
		System.out.println(request.getParameter("writeTel1"));
		System.out.println(request.getParameter("writeTel2"));
		System.out.println(request.getParameter("writeTel3"));
		System.out.println(request.getParameter("yy"));
		System.out.println(request.getParameter("mm"));
		System.out.println(request.getParameter("dd"));
		System.out.println(request.getParameter("writeEmail1"));
		System.out.println(request.getParameter("writeEmail2"));
		System.out.println(request.getParameter("writeemailtf"));
		System.out.println(request.getParameter("writeRecommenderid"));
		//데이터
		String name= request.getParameter("writeName");
		String id = request.getParameter("writeId");
		String pwd = request.getParameter("writePwd");
		String tel1 = request.getParameter("writeTel1");
		String tel2 = request.getParameter("writeTel2");
		String tel3 = request.getParameter("writeTel3");
		int yy = Integer.parseInt(request.getParameter("yy")); 
		int mm = Integer.parseInt(request.getParameter("mm")); 
		int dd = Integer.parseInt(request.getParameter("dd"));
		String email1 = request.getParameter("writeEmail1");
		String email2 = request.getParameter("writeEmail2");
		String emailtf = request.getParameter("writeemailtf");
		String recommenderid = request.getParameter("writeRecommenderid");
		
		MemberDTO memberDTO = new MemberDTO();
		memberDTO.setName(name);
		memberDTO.setId(id);
		memberDTO.setPwd(pwd);
		memberDTO.setTel1(tel1);
		memberDTO.setTel2(tel2);
		memberDTO.setTel3(tel3);
		memberDTO.setYy(yy);
		memberDTO.setMm(mm);
		memberDTO.setDd(dd);
		memberDTO.setEmail1(email1);
		memberDTO.setEmail2(email2);
		memberDTO.setEmailTF(emailtf);
		memberDTO.setRecommenderId(recommenderid);
		
		//DB
		MemberDAO memberDAO = MemberDAO.getInstance();
		
		memberDAO.write(memberDTO);
	
			//응답
			return "/member/write.jsp";
		
	}

}
