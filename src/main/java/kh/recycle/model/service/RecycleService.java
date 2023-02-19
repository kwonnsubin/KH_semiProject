package kh.recycle.model.service;

import static kh.common.jdbc.JDBCTemplate.close;
import static kh.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.List;

import kh.board.model.dao.BoardDao;
import kh.home.model.dao.RecycleDao;
import kh.home.model.vo.RecycleVo;

public class RecycleService {

	// 검색
	public List<RecycleVo> search(String recycle_name) {
		List<RecycleVo> result = null;
		Connection conn = getConnection();
		result = new RecycleDao().search(conn, recycle_name);
		close(conn);
		return result;
	}
	
//	// 검색
//	public String search(String recycle_name) {
//		String result = null;
//		Connection conn = getConnection();
//		result = new RecycleDao().search(conn, recycle_name);
//		close(conn);
//		return result;
//	}
}
