package education.model.service;

import static common.SemiTemplate.*;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import education.model.dao.EduListDao;
import education.model.dto.EduListDto;

public class EduListService {
	private EduListDao dao = new EduListDao();
		// selectPageList
		public Map<String, Object> selectPageList(int pageSize, int pageBlockSize, int currentPageNum) {
			Map<String, Object> result = null;
			Connection con = getConnection(true);
			
			int start = pageSize * (currentPageNum - 1) + 1;
			int end = pageSize * currentPageNum;
			
			// 총글수 289
			int totalCount = dao.selectTotalCount(con);
			
			int totalPageCount = (totalCount % pageSize == 0) ? totalCount / pageSize : totalCount / pageSize + 1;
			
			int startPageNum = (currentPageNum % pageBlockSize == 0) ? ((currentPageNum / pageBlockSize) - 1) * pageBlockSize + 1 : (currentPageNum / pageBlockSize) * pageBlockSize + 1;
			int endPageNum = (startPageNum + pageBlockSize > totalPageCount) ? totalPageCount : startPageNum + pageBlockSize - 1;
			
			List<EduListDto> dtolist = dao.selectPageList(con, start, end);
			close(con);
			
			result = new HashMap<String, Object>();
			result.put("dtolist", dtolist);
			result.put("totalPageCount", totalPageCount);
			result.put("startPageNum", startPageNum);
			result.put("endPageNum", endPageNum);
			result.put("currentPageNum", currentPageNum);
			
			return result;
		}
		
		// selectList - all
		public List<EduListDto> selectList() {
			List<EduListDto> result = null;
			Connection con = getConnection(true);
			result = dao.selectList(con);
			close(con);
			return result;
		}
		
		// selectSubject
		public List<EduListDto> selectSubject(String eduSubject) {
			List<EduListDto> result = null;
			Connection con = getConnection(true);
			result = dao.selectSubject(con, eduSubject);
			close(con);
			return result;
		}
		
		// insert
		public int insert(EduListDto dto) {
			int result = -1;
			Connection con = getConnection(true);
			result = dao.insert(con, dto);
			close(con);
			return result;
		}
		
		// update
		public int update(EduListDto dto) {
			int result = -1;
			Connection con = getConnection(true);
			result = dao.update(con, dto);
			close(con);
			return result;
		}
		// delete
		public int delete(int eduId) {
			int result = 0;
			Connection con = getConnection(true);
			result = dao.delete(con, eduId);
			close(con);
			return result;
		}
}
