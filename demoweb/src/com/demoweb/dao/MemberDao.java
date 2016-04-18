package com.demoweb.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.demoweb.dto.Member;

public class MemberDao {
	
	
	
	
	public void insertMember(Member member) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {			
//			Class.forName("oracle.jdbc.OracleDriver");
//			conn = DriverManager.getConnection(
//				"jdbc:oracle:thin:@localhost:1521:xe", "demoweb", "oracle");
			
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "Insert Into member (memberid, passwd, email, usertype, active) Values (?, ?, ?, ?, ?)";
			
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getPasswd());
			pstmt.setString(3, member.getEmail());
			pstmt.setString(4, member.getUserType());
			pstmt.setBoolean(5, member.isActive());
			
			pstmt.executeUpdate();
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try { pstmt.close(); } catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}
	}
	
	public List<Member> selectMember() {
		ResultSet rs= null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ArrayList<Member> members = new ArrayList<>();
		try {			
//			Class.forName("oracle.jdbc.OracleDriver");
//			conn = DriverManager.getConnection(
//				"jdbc:oracle:thin:@localhost:1521:xe", "demoweb", "oracle");
			conn = ConnectionHelper.getConnection("oracle");
			
			
			String sql = "Select memberId, passwd, email, userType, active From member";
			
			
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			while(rs.next()){
				Member m = new Member();
				
				m.setMemberId(rs.getString(1));
				m.setPasswd(rs.getString(2));
				m.setEmail(rs.getString(3));
				m.setUserType(rs.getString(4));
				m.setActive(rs.getBoolean(5));
				
				members.add(m);
			}
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try { rs.close();} catch (Exception ex){};
			try { pstmt.close(); } catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}
		
		return members;
	}
	
	public Member selectMemberById(String memberId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		
		try {
//			Class.forName("oracle.jdbc.OracleDriver");
//			conn = DriverManager.getConnection(
//				"jdbc:oracle:thin:@localhost:1521:xe", 
//				"demoweb", "oracle");
			conn = ConnectionHelper.getConnection("oracle");
			
			//3. 명령 생성
			String sql = 
				"SELECT memberid, email, usertype, active, regdate " + 
				"FROM member " +
				"WHERE memberid = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memberId);
			//4. 명령 실행
			rs = pstmt.executeQuery();
			//5. 조회 결과를 처리 (SELECT QUERY인 경우)
			if (rs.next()) {
				member = new Member();
				member.setMemberId(rs.getString(1));
				member.setEmail(rs.getString(2));
				member.setUserType(rs.getString(3));
				member.setActive(rs.getBoolean(4));
				member.setRegDate(rs.getDate(5));
			}
			
		} catch (Exception ex) {
			
		} finally {
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close(); } catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}
		
		return member;
	}	
	
	public Member selectMemberByIdAndPasswd(String id, String passwd) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Member member = null;
		
		try {			
//			Class.forName("oracle.jdbc.OracleDriver");
//			conn = DriverManager.getConnection(
//				"jdbc:oracle:thin:@localhost:1521:xe", 
//				"demoweb", "oracle");
			conn = ConnectionHelper.getConnection("oracle");
			
			//3. 명령 생성
			String sql = 
				"SELECT memberid, email, usertype, active, regdate " + 
				"FROM member " +
				"WHERE memberid = ? AND passwd = ?";				
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setString(2, passwd);
			//4. 명령 실행
			rs = pstmt.executeQuery();
			//5. 조회 결과를 처리 (SELECT QUERY인 경우)
			if (rs.next()) {
				member = new Member();
				member.setMemberId(rs.getString(1));
				member.setEmail(rs.getString(2));
				member.setUserType(rs.getString(3));
				member.setActive(rs.getBoolean(4));
				member.setRegDate(rs.getDate(5));
			}
			
		} catch (Exception ex) {
			
		} finally {
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close(); } catch (Exception ex) {}
			try { conn.close(); } catch (Exception ex) {}
		}
		
		return member;//null or 조회된 결과를 저장한 인스턴스 참조
	}

}
