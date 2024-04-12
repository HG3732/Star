package member.vo.service;

import java.sql.Connection;
import java.util.List;
import member.model.dao.MemberDao;
import member.model.dto.MemberDto;
import member.model.dto.MemberInfoDto;
import member.model.dto.MemberLoginDto;
import static common.SemiTemplate.*;

public class MemberService {
	private MemberDao dao = new MemberDao();

	public MemberInfoDto loginGetInfo(MemberLoginDto dto) {
		MemberInfoDto result = null;
		Connection conn = getConnection(true);
		result = dao.loginGetInfo(conn, dto);
		
		close(conn);
		return result;
	}
	
	public int login(MemberLoginDto dto) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.login(conn, dto);
		
		close(conn);
		return result;
	}
	
	public int selectCheckId(String memId) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.selectCheckId(conn, memId);
		
		close(conn);
		return result;
	}
	
	
	public List<MemberDto> selectAllList() {
		List<MemberDto> result = null;
		Connection conn = getConnection(true);
		result = dao.selectAllList(conn);
		close(conn);
		return result;
	}
	//select one
	public MemberDto selectOne(String memId) {
		MemberDto result = null;
		Connection conn = getConnection(true);
		result = dao.selectOne(conn, memId);
		
		close(conn);
		return result;
	}
	//insert
	public int insert(MemberDto dto) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.insert(conn, dto);
		close(conn);
		return result;
	}
	//update
	public int update(MemberDto dto) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.update(conn, dto);
		close(conn);
		return result;
	}
	//deletes
	public int delete(String memId) {
		int result = 0;
		Connection conn = getConnection(true);
		result = dao.delete(conn, memId);
		close(conn);
		return result;
	}
}
