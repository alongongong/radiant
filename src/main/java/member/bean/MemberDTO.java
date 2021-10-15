package member.bean;

import lombok.Data;

@Data
public class MemberDTO {
	private String name;
	private String id;
	private String pwd;
	private String tel1;
	private String tel2;
	private String tel3;
	private int yy;
	private int mm;
	private int dd;
	private String email1;
	private String email2;
	private String emailTF; // 메일수신여부
	private String recommenderId; // 추천인 ID
	private String memberGrade; 
	// 회원등급. silver, gold, vip, vvip 
	private String logtime; // 가입일자
}
