package com.demoweb.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.demoweb.dto.Schedule;
import com.demoweb.dto.UploadFile;

public class ScheduleDao {

	String dsn = "oracle";

	public int insertSchedule(Schedule schedule) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int newScheduleNo = -1;
		try {
			conn = ConnectionHelper.getConnection(dsn);

			StringBuilder sql = new StringBuilder(256);
			sql.append("INSERT INTO schedule ")
					.append("(idxno, sclass, sdate, ssubject, stime, scontent, swriter, simgname) ").append("VALUES ")
					.append("(schedule_sequence.nextVal, ?, ?, ?, ?, ?, ?, ?)");

			java.sql.Date sqlDate = (java.sql.Date) schedule.getsDate();
			pstmt = conn.prepareStatement(sql.toString());
			pstmt.setString(1, schedule.getsClass());
			pstmt.setDate(2, sqlDate);
			pstmt.setString(3, schedule.getsSubject());
			pstmt.setString(4, schedule.getsTime());
			pstmt.setString(5, schedule.getsContent());
			pstmt.setString(6, schedule.getsWriter());
			pstmt.setString(7, schedule.getsImageName());

			pstmt.executeUpdate();

			pstmt.close();

			pstmt = conn.prepareStatement("SELECT schedule_sequence.currVal FROM dual");
			rs = pstmt.executeQuery();
			rs.next();
			newScheduleNo = rs.getInt(1);

		} catch (Exception ex) {
			try {
				conn.rollback();
			} catch (Exception ex2) {
			}
			ex.printStackTrace();
		} finally {
			// 6. 연결닫기
			try {
				rs.close();
			} catch (Exception ex) {
			}
			try {
				pstmt.close();
			} catch (Exception ex) {
			}
			try {
				conn.close();
			} catch (Exception ex) {
			}
		}
		return newScheduleNo;
	}

	public void insertUploadFile(UploadFile file) {

		Connection conn = null;
		PreparedStatement pstmt = null;

		try {
			conn = ConnectionHelper.getConnection("oracle");
			String sql = "INSERT INTO uploadfile " + "(uploadfileno, uploadno, savedfilename, userfilename) "
					+ "VALUES (uploadfile_sequence.nextVal, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, file.getUploadNo());
			pstmt.setString(2, file.getSavedFileName());
			pstmt.setString(3, file.getUserFileName());
			pstmt.executeUpdate();

		} catch (Exception ex) {
			ex.printStackTrace();
		} finally {
			try {
				pstmt.close();
			} catch (Exception ex) {
			}
			try {
				conn.close();
			} catch (Exception ex) {
			}
		}

	}

}
