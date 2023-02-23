package kh.recycle.model.dao;

import static kh.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kh.board.model.vo.BoardVo;
import kh.recycle.model.vo.RecycleVo;

public class RecycleDao {
	
	// 검색
	public List<RecycleVo> search(Connection conn, String recycle_name) {
		List<RecycleVo> result = null;
		String sql = "select Cf_code, Recycle_code, recycle_name, image from recycle join cf_code using (recycle_code) join cf using (cf_code) where recycle_name LIKE ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, "%" + recycle_name + "%"); // 와일드카드 특정한문자를 포함한 모든결과가 다 출력
			rs = pstmt.executeQuery();			
			// 다중행
			result = new ArrayList<RecycleVo>();
			while(rs.next()) {
				RecycleVo vo = new RecycleVo();
				vo.setCf_code(rs.getInt(1));
				vo.setRecycle_code(rs.getInt(2));
				vo.setRecycle_name(rs.getString(3));
				vo.setImg(rs.getString(4));
//				vo.setRecycle_tag(rs.getString(4));
//				vo.setRecycle_check(rs.getString(5));
//				vo.setContent(rs.getString(6));
//				vo.setCf_name(rs.getString(7));					
				result.add(vo); // vo에 저장한 값들을 ArrayList에 추가

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("dao:" + result);
		return result;
	}
	
	// 재활용 내용
	public List<RecycleVo> recycleDetail(Connection conn, int recycle_code) {
		List<RecycleVo> result = null;
		String sql = "select cf_code, recycle_code, recycle_name, recycle_tag, recycle_check, content, title, cf_name, image from recycle join cf_code using (recycle_code) join cf using (cf_code) where recycle_code = ?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1,recycle_code); 
			rs = pstmt.executeQuery();			
			// 다중행
			result = new ArrayList<RecycleVo>();
			while(rs.next()) {
				RecycleVo vo = new RecycleVo();
				vo.setCf_code(rs.getInt(1));
				vo.setRecycle_code(rs.getInt(2));
				vo.setRecycle_name(rs.getString(3));
				vo.setRecycle_tag(rs.getString(4));
				vo.setRecycle_check(rs.getString(5));
				vo.setContent(rs.getString(6));
				vo.setTitle(rs.getString(7));
				vo.setCf_name(rs.getString(8));	
				vo.setImg(rs.getString(9));
				result.add(vo); // vo에 저장한 값들을 ArrayList에 추가

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println("dao:" + result);
		return result;
	}
	
	
	
	
	
	
	
	
}