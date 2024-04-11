package education.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import education.model.dto.EduListDto;

import static common.SemiTemplate.*;

public class EduListDao {
//	EDU_ID          NOT NULL NUMBER        
//	EDU_SUBJECT     NOT NULL VARCHAR2(100) 
//	EDU_PARTICIPANT NOT NULL VARCHAR2(30)  
//	EDU_MONTH       NOT NULL VARCHAR2(7)   
//	EDU_BOOK_PERIOD NOT NULL VARCHAR2(25)  
//	EDU_PERIOD      NOT NULL VARCHAR2(25)  
//	EDU_WRITE_TIME  NOT NULL TIMESTAMP(6) 
	
	// selectTotalCount
	public int selectTotalCount(Connection con) {
		int result = 0;
		String sql = "select count(*) cnt from edu_list";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				result = rs.getInt("cnt");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(rs);
		close(pstmt);
		return result;
	}
	
	// selectPageList
	public List<EduListDto> selectPageList(Connection con, int start, int end) {
		List<EduListDto> result = null;
		String sql = "SELECT E2.*"
				+ " FROM (SELECT E1.*, ROWNUM RN FROM (SELECT EDU_ID ,EDU_SUBJECT ,EDU_ADDRESS ,EDU_PARTICIPANT ,EDU_DAY ,EDU_MONTH ,EDU_BOOK_PERIOD ,EDU_PERIOD ,EDU_WRITE_TIME  FROM EDU_LIST ORDER BY EDU_ID) E1) E2"
				+ " WHERE RN BETWEEN ? AND ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			rs = pstmt.executeQuery();
			
			// ResultSet 처리
			if(rs.next()) {
				result = new ArrayList<EduListDto>();
				do {
					EduListDto dto = new EduListDto(
							rs.getInt("EDU_ID")
							, rs.getString("EDU_SUBJECT")
							, rs.getString("EDU_PARTICIPANT")
							, rs.getString("EDU_MONTH")
							, rs.getString("EDU_BOOK_PERIOD")
							, rs.getString("EDU_PERIOD")
							, rs.getString("EDU_WRITE_TIME")
							);
					result.add(dto);
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(rs);
		close(pstmt);
		return result;
	}
	
	// selectList
	public List<EduListDto> selectList(Connection con) {
		List<EduListDto> result = null;
		String sql = "SELECT EDU_ID, EDU_SUBJECT, EDU_PARTICIPANT, EDU_MONTH, EDU_BOOK_PERIOD, EDU_PERIOD, EDU_WRITE_TIME FROM EDU_LIST";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			// ResultSet 처리
			if(rs.next()) {
				result = new ArrayList<EduListDto>();
				do {
					EduListDto dto = new EduListDto(
							rs.getInt("EDU_ID")
							, rs.getString("EDU_SUBJECT")
							, rs.getString("EDU_PARTICIPANT")
							, rs.getString("EDU_MONTH")
							, rs.getString("EDU_BOOK_PERIOD")
							, rs.getString("EDU_PERIOD")
							, rs.getString("EDU_WRITE_TIME")
							);
					result.add(dto);
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(rs);
		close(pstmt);
		return result;
	}
	
	// selectSubject
	public List<EduListDto> selectSubject(Connection con, String eduSubject) {
		List<EduListDto> result = null;
		String sql = "SELECT EDU_ID, EDU_SUBJECT, EDU_PARTICIPANT, EDU_MONTH, EDU_BOOK_PERIOD, EDU_PERIOD, EDU_WRITE_TIME FROM EDU_LIST WHERE EDU_SUBJECT LIKE '%?%'";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, eduSubject);
			
			rs = pstmt.executeQuery();
			
			// ResultSet 처리
			if(rs.next()) {
				result = new ArrayList<EduListDto>();
				do {
					EduListDto dto = new EduListDto(
							rs.getInt("EDU_ID")
							, rs.getString("EDU_SUBJECT")
							, rs.getString("EDU_PARTICIPANT")
							, rs.getString("EDU_MONTH")
							, rs.getString("EDU_BOOK_PERIOD")
							, rs.getString("EDU_PERIOD")
							, rs.getString("EDU_WRITE_TIME")
							);
					result.add(dto);
				}while(rs.next());
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(rs);
		close(pstmt);
		return result;
	}
	
	// insert
	public int insert(Connection con, EduListDto dto) {
		int result = -1;
//		INSERT INTO MEMBER VALUES('kh'||K, 'pwd'||K, 'kh'||K||'@a.com', '이름'||K);
		String sql = "INSERT INTO EDU_LIST (EDU_ID, EDU_SUBJECT, EDU_PARTICIPANT, EDU_MONTH, EDU_BOOK_PERIOD, EDU_PERIOD, EDU_WRITE_TIME) "
								+ "VALUES((SELECT NVL(MAX(EDU_ID), 0) + 1), ?, ?, ?, ?, ?, DEFAULT)";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			// ? 자리
			pstmt.setString(1, dto.getEduSubject());
			pstmt.setString(2, dto.getEduParticipant());
			pstmt.setString(3, dto.getEduMonth());
			pstmt.setString(4, dto.getEduBookPeriod());
			pstmt.setString(5, dto.getEduPeriod());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(pstmt);
		return result;
	}
	
	// update
	public int update(Connection con, EduListDto dto) {
		int result = -1;
		String sql = "UPDATE EDU_LIST SET EDU_SUBJECT = ?, EDU_BOOK_PERIOD = ?, EDU_PERIOD = ?"; // TODO
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, dto.getEduSubject());
			pstmt.setString(2, dto.getEduBookPeriod());
			pstmt.setString(3, dto.getEduPeriod());
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(pstmt);
		return result;
	}
	// delete
	public int delete(Connection con, int eduId) {
		int result = 0;
		String sql = "DELETE FROM EDU_LIST WHERE EDU_ID = ?";
		PreparedStatement pstmt = null;
		
		try {
			pstmt = con.prepareStatement(sql);
			// ? 자리
			pstmt.setInt(1, eduId);
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		close(pstmt);
		return result;
	}
}
