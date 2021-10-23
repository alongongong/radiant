package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import member.bean.MemberDTO;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private DataSource ds;
	
	private static MemberDAO instance;
	
	// 싱글톤
	public static MemberDAO getInstance() {
		if(instance == null) {
			synchronized (MemberDAO.class) {
				instance = new MemberDAO();		
			}
		} // if
		
		return instance;
	} // getInstance();
	
	public MemberDAO() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	} // 생성자
	
	public void write(MemberDTO memberDTO) {
		String sql ="insert into radiantMember values(?,?,?,?,?,?,?,?,?,?,?,?,?,'silver',sysdate)";
		
		try {
			conn=ds.getConnection();
			
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getId());
			pstmt.setString(3, memberDTO.getPwd());
			pstmt.setString(4, memberDTO.getTel1());
			pstmt.setString(5, memberDTO.getTel2());
			pstmt.setString(6, memberDTO.getTel3());
			pstmt.setInt(7, memberDTO.getYy());
			pstmt.setInt(8, memberDTO.getMm());
			pstmt.setInt(9, memberDTO.getDd());
			pstmt.setString(10, memberDTO.getEmail1());
			pstmt.setString(11, memberDTO.getEmail2());
			pstmt.setString(12, memberDTO.getEmailTF());
			pstmt.setString(13, memberDTO.getRecommenderId());
			
			pstmt.executeUpdate();	
	
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	} // write()
	
	public boolean isCheckId(String id) {
		boolean exist = false; 
		
		String sql = "select * from radiantMember where id=?";
		
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, id);
			
			rs= pstmt.executeQuery();//실행
			
			if(rs.next()) {
				exist=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}		
		return exist;
	} // isCheckId
	
	public MemberDTO isCheckPhone(String tel1, String tel2, String tel3) {
		MemberDTO memberDTO = null; 
		
		String sql = "select * from radiantMember where tel1=? and tel2=? and tel3=?";
		
		try {
			conn=ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, tel1);
			pstmt.setString(2, tel2);
			pstmt.setString(3, tel3);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				
				memberDTO = new MemberDTO();
				
				memberDTO.setTel1(rs.getString("tel1"));
				memberDTO.setTel2(rs.getString("tel2"));
				memberDTO.setTel3(rs.getString("tel3"));
			
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}	
	}
		return memberDTO;
	} // isCheckPhone
	public MemberDTO login(String id, String pwd) {
		MemberDTO memberDTO = null;
		String sql = "select * from radiantmember where id=? and pwd=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberDTO = new MemberDTO();
				memberDTO.setName(rs.getString("name"));
				memberDTO.setTel1(rs.getString("tel1"));
				memberDTO.setTel2(rs.getString("tel2"));
				memberDTO.setTel3(rs.getString("tel3"));
				memberDTO.setMemberGrade(rs.getString("membergrade"));
				System.out.println(rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return memberDTO;
	} // login

	public String getFindId(MemberDTO memberDTO) {
		String id = null;
		String sql = "select id from radiantmember where name=? and tel1=? and tel2=? and tel3=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberDTO.getName());
			pstmt.setString(2, memberDTO.getTel1());
			pstmt.setString(3, memberDTO.getTel2());
			pstmt.setString(4, memberDTO.getTel3());
			
			rs = pstmt.executeQuery(); // 실행
			
			if(rs.next())
				id = rs.getString("id");
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return id;
	} // getFindId

	public boolean getFindPwd(MemberDTO memberDTO) {
		boolean exist = false;
		String sql = "select * from radiantmember where id=? and name=? and tel1=? and tel2=? and tel3=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memberDTO.getId());
			pstmt.setString(2, memberDTO.getName());
			pstmt.setString(3, memberDTO.getTel1());
			pstmt.setString(4, memberDTO.getTel2());
			pstmt.setString(5, memberDTO.getTel3());
			
			rs = pstmt.executeQuery();
			if(rs.next())
				exist = true;
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return exist;
	} // getFindPwd()

	public void changePwd(String id, String currentPwd, String pwd) {
		String sql = "update radiantmember set pwd=? where id=? and pwd=?";
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, pwd);
			pstmt.setString(2, id);
			pstmt.setString(3, currentPwd);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} // changePwd()

	public MemberDTO getMember(String id) {
		String sql = "select * from radiantmember where id=?";
		MemberDTO memberDTO = null;
		
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				memberDTO =  new MemberDTO();
				memberDTO.setId(id);
				memberDTO.setName(rs.getString("name"));
				memberDTO.setTel1(rs.getString("tel1"));
				memberDTO.setTel2(rs.getString("tel2"));
				memberDTO.setTel3(rs.getString("tel3"));
				memberDTO.setEmail1(rs.getString("email1"));
				memberDTO.setEmail2(rs.getString("email2"));
				memberDTO.setEmailTF(rs.getString("emailtf"));
				memberDTO.setYy(rs.getInt("yy"));
				memberDTO.setMm(rs.getInt("mm"));
				memberDTO.setDd(rs.getInt("dd"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return memberDTO;
	} // getMember()

	public void update(MemberDTO memberDTO) {
		String sql = "update radiantmember set tel1=?, tel2=?, tel3=?, email1=?, email2=?, emailTF=? where id=?";
		try {
			conn = ds.getConnection();
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, memberDTO.getTel1());
			pstmt.setString(2, memberDTO.getTel2());
			pstmt.setString(3, memberDTO.getTel3());
			pstmt.setString(4, memberDTO.getEmail1());
			pstmt.setString(5, memberDTO.getEmail2());
			pstmt.setString(6, memberDTO.getEmailTF());
			pstmt.setString(7, memberDTO.getId());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	} // update()

	public void delete(String id, String pwd) {
		String sql = "delete radiantmember where id=? and pwd=?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, pwd);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}	
	} // delete()
	
}
