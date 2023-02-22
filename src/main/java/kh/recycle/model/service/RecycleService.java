package kh.recycle.model.service;

import static kh.common.jdbc.JDBCTemplate.close;
import static kh.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import kh.board.model.dao.BoardDao;
import kh.recycle.model.dao.RecycleDao;
import kh.recycle.model.vo.RecycleVo;

public class RecycleService {

	// 검색
	public List<RecycleVo> search(String recycle_name) {
		List<RecycleVo> result = null;
		Connection conn = getConnection();
		result = new RecycleDao().search(conn, recycle_name);
		close(conn);
		return result;
	}
	
	// 재활용 상세 내용
	public List<RecycleVo> recycleDetail(int recycle_code) {
		List<RecycleVo> result = null;
		Connection conn = getConnection();
		result = new RecycleDao().recycleDetail(conn, recycle_code);
		close(conn);
		return result;
		
	}
}
