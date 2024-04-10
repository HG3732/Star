package board.model.dao;

import static common.SemiTemplate.*;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import board.model.dto.BoardListDto;

//이름               널?       유형             
//---------------- -------- -------------- 
//BOARD_NO         NOT NULL NUMBER         
//BOARD_WRITER              VARCHAR2(15)   
//BOARD_TITLE      NOT NULL VARCHAR2(20)   
//BOARD_CONTENT    NOT NULL VARCHAR2(4000) 
//BOARD_WRITE_TIME NOT NULL TIMESTAMP(6)   
//HIT              NOT NULL NUMBER         
//MEMBER_ADMIN     NOT NULL NUMBER(1)      

public class BoardDao {
	// selecAllList
	public List<BoardListDto> selectAllList(Connection conn) {
		List<BoardListDto> result = null;
		String sql = "SELECT BOARD_NO, BOARD_TITLE, BOARD_WRITER, BOARD_WRITE_TIME, HIT FROM BOARD_COMMUNITY";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
	    try {
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        // ResultSet 처리
	        result = new ArrayList<>();
	        while (rs.next()) {
	            BoardListDto dto = new BoardListDto(
	                rs.getInt("BOARD_NO"),
	                rs.getString("BOARD_TITLE"),
	                rs.getString("BOARD_WRITER"),
	                rs.getString("BOARD_WRITE_TIME"),
	                rs.getInt("HIT")
	            );
	            result.add(dto);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return result;
	}

//		try {
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			// ResultSet 처리
//			if (rs.next()) {
//				result = new ArrayList<BoardListDto>();
//				do {
//					BoardListDto dto = new BoardListDto(rs.getInt("BOARD_NO"), rs.getString("BOARD_TITLE"),
//							rs.getString("BOARD_WRITER"), rs.getString("BOARD_WRITE_TIME"), rs.getInt("HIT"));
//					result.add(dto);
//				} while (rs.next());
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//
//		close(rs);
//		close(pstmt);
//		return result;
//
//	}

	// selectOne

	// insertList

	// listContent

	// deleteList
}
