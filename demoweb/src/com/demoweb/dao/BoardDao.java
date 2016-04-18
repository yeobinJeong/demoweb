package com.demoweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.demoweb.dto.Board;
import com.demoweb.dto.BoardComment;

public class BoardDao {
	
	String dsn = "oracle";

	public int insertBoard(Board board) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int newBoardNo = -1;
		
		try {
			conn = ConnectionHelper.getConnection(dsn);
			
			StringBuilder sql = new StringBuilder(256);
			sql.append("INSERT INTO board ")
			   .append("(boardno, title, writer, content, groupno, step) ")
			   .append("VALUES ")
			   .append("(board_sequence.nextVal, ?, ?, ?, board_sequence.currVal, 1)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContent());
			
			pstmt.executeUpdate();
			
			pstmt.close();
			
			//새로 삽입된 글 번호 조회
			pstmt = 
				conn.prepareStatement("SELECT board_sequence.currVal FROM dual");
			rs = pstmt.executeQuery();
			rs.next();
			newBoardNo = rs.getInt(1);
			
		} catch (Exception ex) {
			try { conn.rollback(); } catch (Exception ex2) {}
			ex.printStackTrace();
		} finally {
			//6. 연결닫기
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close(); } catch (Exception ex) {}			
			try { conn.close(); } catch (Exception ex) {}
		}
		
		return newBoardNo;
	}
	
	public int insertReply(Board board) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int newBoardNo = -1;
		
		try {
			//원글 정보 조회
			Board parent = selectBoardByBoardNo(board.getBoardNo());
			
			conn = ConnectionHelper.getConnection(dsn);
			conn.setAutoCommit(false);//트랜잭션 시작
			
			StringBuilder sql = new StringBuilder(256);
			sql.append("UPDATE board ")
			   .append("	SET step = step + 1 ")
			   .append("WHERE groupno = ? AND step > ?");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, parent.getGroup());
			pstmt.setInt(2, parent.getStep());
			
			pstmt.executeUpdate();
			pstmt.close();
					
			sql.delete(0, sql.length());			
			sql.append("INSERT INTO board ")
			   .append("(boardno, title, writer, content, groupno, step, depth) ")
			   .append("VALUES ")
			   .append("(board_sequence.nextVal, ?, ?, ?, ?, ?, ?)");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getWriter());
			pstmt.setString(3, board.getContent());
			pstmt.setInt(4, parent.getGroup());		//부모글과 같은 groupno
			pstmt.setInt(5, parent.getStep() + 1);	//부모글의 step + 1
			pstmt.setInt(6, parent.getDepth() + 1);	//부모글의 depth + 1
			
			pstmt.executeUpdate();
			
			pstmt.close();
			
			//새로 삽입된 글 번호 조회
			pstmt = 
				conn.prepareStatement("SELECT board_sequence.currVal FROM dual");
			rs = pstmt.executeQuery();
			rs.next();
			newBoardNo = rs.getInt(1);
			
			conn.commit();//트랜잭션 확정
			
		} catch (Exception ex) {
			//트랜잭션 취소			
			try { conn.rollback(); } catch (Exception ex2) {}
			ex.printStackTrace();
		} finally {
			try { conn.setAutoCommit(true); } catch (Exception ex) {}
			//6. 연결닫기
			try { rs.close(); } catch (Exception ex) {}
			try { pstmt.close(); } catch (Exception ex) {}			
			try { conn.close(); } catch (Exception ex) {}
		}
		
		return newBoardNo;
	}
	
	///////////////////////////////////
	
	public List<Board> selectBoardList() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;//조회 결과에 접근하는 참조 변수
		//데이터베이스의 데이터를 읽어서 저장할 객체 컬렉션
		ArrayList<Board> boards = new ArrayList<Board>();
		
		try {
			conn = ConnectionHelper.getConnection(dsn);
			StringBuilder sql = new StringBuilder(512);
			sql.append("SELECT boardno, title, writer, ")
			   .append("readcount, regdate, deleted, groupno, step, depth ")
			   .append("FROM board ")
			   .append("ORDER BY groupno DESC, step ASC ");
			pstmt = conn.prepareStatement(sql.toString());			
			
			rs = pstmt.executeQuery();
			
			while (rs.next()) {
				Board board = new Board();
				board.setBoardNo(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setWriter(rs.getString(3));
				//board.setContent(rs.getString(4));
				board.setReadCount(rs.getInt(4));
				board.setRegDate(rs.getDate(5));
				board.setDeleted(rs.getBoolean(6));
				board.setGroup(rs.getInt(7));
				board.setStep(rs.getInt(8));
				board.setDepth(rs.getInt(9));
				
				boards.add(board);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			//6. 연결닫기
			if (rs != null) try { rs.close(); } catch (Exception ex) {}
			if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
			if (conn != null) try { conn.close(); } catch (Exception ex) {}
		}
		
		return boards;
	}

	///////////////////////////////////////////////
	
	public Board selectBoardByBoardNo(int number) {
		Connection conn = null;
		PreparedStatement pstmt = null, pstmt2 = null;
		ResultSet rs = null, rs2 = null;
		Board board = null;
		
		try {
			conn = ConnectionHelper.getConnection(dsn);
			StringBuffer sql = new StringBuffer(300);
			sql.append("SELECT "); 
			sql.append("boardno, title, writer, content, ");
			sql.append("regdate, readcount, ");
			sql.append("deleted, groupno, step, depth ");
			sql.append("FROM board ");
			sql.append("WHERE boardno = ? AND deleted = '0'");
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, number);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				board = new Board();
				board.setBoardNo(rs.getInt(1));
				board.setTitle(rs.getString(2));
				board.setWriter(rs.getString(3));
				board.setContent(rs.getString(4));
				board.setRegDate(rs.getDate(5));
				board.setReadCount(rs.getInt(6));
				board.setDeleted(rs.getBoolean(7));
				board.setGroup(rs.getInt(8));
				board.setStep(rs.getInt(9));
				board.setDepth(rs.getInt(10));
				
				//댓글 조회
				sql.delete(0, sql.length());//StringBuilder 비우기
				sql.append("SELECT commentno, boardno, ")
				   .append("	   writer, content, regdate ")
				   .append("FROM boardcomment ")
				   .append("WHERE boardno = ?");
				pstmt2 = conn.prepareStatement(sql.toString());
				pstmt2.setInt(1, number);
				rs2 = pstmt2.executeQuery();
				ArrayList<BoardComment> comments 
					= new ArrayList<BoardComment>();
				while (rs2.next()) {
					BoardComment comment = new BoardComment();
					comment.setCommentNo(rs2.getInt(1));
					comment.setBoardNo(rs2.getInt(2));
					comment.setWriter(rs2.getString(3));
					comment.setContent(rs2.getString(4));
					comment.setRegDate(rs2.getDate(5));
					comments.add(comment);
				}
				board.setComments(comments);
				
			}			
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try { if (rs2 != null) rs2.close(); } catch (Exception ex) { }
			try { if (pstmt2 != null) pstmt2.close(); } catch (Exception ex) { }
			try { if (rs != null) rs.close(); } catch (Exception ex) { }
			try { if (pstmt != null) pstmt.close(); } catch (Exception ex) { }
			try { if (conn != null) conn.close(); } catch (Exception ex) { }
		}
		return board;
	}	

	public List<Board> selectBoardList2(int start, int last) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Board> boards = new ArrayList<Board>();
		
		try {
			conn = ConnectionHelper.getConnection(dsn);
			StringBuffer sql = new StringBuffer(500);
			sql.append("SELECT * ");
			sql.append("FROM ");
			
			sql.append("( ");
			sql.append("	SELECT "); 
			sql.append("		rownum idx, s.* "); 
			sql.append("	FROM ");
			
			sql.append("	( ");
			sql.append("		SELECT "); 
			sql.append("			boardno, title, writer, ");
			sql.append("			regdate, readcount, ");
			sql.append("			deleted, groupno, step, depth ");
			sql.append("		FROM ");
			sql.append("			board ");
//			sql.append("		WHERE ");
//			sql.append("			deleted = '0' ");
			sql.append("		ORDER BY groupno DESC, step ASC ");
			sql.append("	) s ");
			
			sql.append(") ");
			
			sql.append("WHERE idx >= ? AND idx < ?");
			
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setInt(1, start);
			pstmt.setInt(2, last);
			rs = pstmt.executeQuery();			
			
			while (rs.next()) {
				Board board = new Board();
				board.setBoardNo(rs.getInt(2));
				board.setTitle(rs.getString(3));
				board.setWriter(rs.getString(4));
				board.setRegDate(rs.getDate(5));
				board.setReadCount(rs.getInt(6));
				board.setDeleted(rs.getBoolean(7));
				board.setGroup(rs.getInt(8));
				board.setStep(rs.getInt(9));
				board.setDepth(rs.getInt(10));
				
				boards.add(board);
			}
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
			if (conn != null) try { conn.close(); } catch (Exception ex) {}
		}
		
		return boards;
	}
	
	public int getBoardCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int count = 0;
		try {
			conn = ConnectionHelper.getConnection(dsn);
			String sql = "SELECT COUNT(*) FROM board";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next())
				count = rs.getInt(1);
			
		} catch (Exception ex) {
			count = 0;
			ex.printStackTrace();			
		} finally {
			try { if (rs != null) rs.close(); } catch (Exception ex) { }
			try { if (pstmt != null) pstmt.close(); } catch (Exception ex) { }
			try { if (conn != null) conn.close(); } catch (Exception ex) { }
		}
		return count;
	}
	
	public int deleteBoard(int number) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			conn = ConnectionHelper.getConnection(dsn);
			String sql =
				"UPDATE board " +
				"SET deleted = '1' " + 
				"WHERE boardno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			count = pstmt.executeUpdate();
		} catch (Exception ex) {
			count = 0;
			ex.printStackTrace();
		} finally {
			try { if (pstmt != null) pstmt.close(); } catch (Exception ex) { }
			try { if (conn != null) conn.close(); } catch (Exception ex) { }
		}
		return count;
	}
	
	public void updateBoardReadCount(int number) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ConnectionHelper.getConnection(dsn);
			String sql = 
				"UPDATE board " +
				"SET readcount = readcount + 1 " + 
				"WHERE boardno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, number);
			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try { if (pstmt != null) pstmt.close(); } catch (Exception ex) { }
			try { if (conn != null) conn.close(); } catch (Exception ex) { }
		}
	}
	
	public int updateBoard(Board board) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int count = 0;
		try {
			conn = ConnectionHelper.getConnection(dsn);
			String sql = 
				"UPDATE board " +
				"SET title = ?, content = ? " + 
				"WHERE boardno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, board.getTitle());
			pstmt.setString(2, board.getContent());
			pstmt.setInt(3, board.getBoardNo());
			count = pstmt.executeUpdate();
		} catch (Exception ex) {
			count = 0;
			ex.printStackTrace();
		} finally {
			try { if (pstmt != null) pstmt.close(); } catch (Exception ex) { }
			try { if (conn != null) conn.close(); } catch (Exception ex) { }
		}
		return count;
	}
		

	public void insertComment(BoardComment comment) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ConnectionHelper.getConnection(dsn);
			
			String sql = 
				"INSERT INTO boardcomment " +
				"(commentno, boardno, writer, content) " +
				"VALUES (boardcomment_sequence.nextVal, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, comment.getBoardNo());
			pstmt.setString(2, comment.getWriter());
			pstmt.setString(3, comment.getContent());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
			if (conn != null) try { conn.close(); } catch (Exception ex) {}
		}
	}
	
	public void updateComment(BoardComment comment) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ConnectionHelper.getConnection(dsn);
			
			String sql = 
				"UPDATE boardcomment " +
				"SET content = ?" +
				"WHERE commentno = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, comment.getContent());
			pstmt.setInt(2, comment.getCommentNo());

			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
			if (conn != null) try { conn.close(); } catch (Exception ex) {}
		}
	}
	
	public void deleteComment(int commentNo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			conn = ConnectionHelper.getConnection(dsn);
			
			String sql = 
				"DELETE FROM boardcomment " +				
				"WHERE commentno = ?";
			pstmt = conn.prepareStatement(sql);			
			pstmt.setInt(1, commentNo);

			pstmt.executeUpdate();
		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			if (pstmt != null) try { pstmt.close(); } catch (Exception ex) {}
			if (conn != null) try { conn.close(); } catch (Exception ex) {}
		}
	}
	

	
}