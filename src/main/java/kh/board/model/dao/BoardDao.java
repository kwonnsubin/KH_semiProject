package kh.board.model.dao;

import static kh.common.jdbc.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import kh.board.model.vo.BoardVo;
import kh.member.model.vo.MemberVo;

public class BoardDao {
	
//	// 게시판 목록(selectPage으로 대체)
//	public List<BoardVo> boardList(Connection conn) {
//		BoardVo result = null; // 결과값을 저장하기 위한 result
//		String sql = "select BOARD_NO, WRITER, PWD, TITLE, CONTENT, REGDATE, CATEGORY from BOARD_T ORDER BY BOARD_NO DESC";
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		List<BoardVo> list = new ArrayList<BoardVo>(); // 게시판 목록 담을 list
//		try {
//			pstmt = conn.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//			while(rs.next()) {
//				result = new BoardVo();
//				result.setBoard_no(rs.getInt(1));
//				result.setWriter(rs.getString(2));
//				result.setPwd(rs.getString(3));
//				result.setTitle(rs.getString(4));
//				result.setContent(rs.getString(5));
//				result.setRegdate(rs.getTimestamp(6));
//				result.setCategory(rs.getInt(7));
//				list.add(result);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close(rs);
//			close(pstmt);
//		}
//		
//		return list;
//	}
	
	// 게시판 목록(페이징)
	public List<BoardVo> selectPage(Map<String, Object> map, Connection conn) {
	    BoardVo result = null;
	    String sql = "SELECT BOARD_NO, WRITER, PWD, TITLE, CONTENT, REGDATE, CATEGORY "
	            + "FROM ( "
	            + "SELECT ROWNUM AS N "
	            + ", BOARD_NO "
	            + ", WRITER "
	            + ", PWD "
	            + ", TITLE "
	            + ", CONTENT "
	            + ", REGDATE "
	            + ", CATEGORY "
	            + "FROM (SELECT * FROM BOARD_T ORDER BY REGDATE DESC) "
	            + ") "
	            + "WHERE N BETWEEN ? AND ?";
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    List<BoardVo> list = new ArrayList<BoardVo>();
	    try {
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, (int) map.get("start"));
	        pstmt.setInt(2, (int) map.get("end"));
	        rs = pstmt.executeQuery();
	        while (rs.next()) {
	            result = new BoardVo();
	            result.setBoard_no(rs.getInt(1));
	            result.setWriter(rs.getString(2));
	            result.setPwd(rs.getString(3));
	            result.setTitle(rs.getString(4));
	            result.setContent(rs.getString(5));
	            result.setRegdate(rs.getTimestamp(6));
	            result.setCategory(rs.getInt(7));
	            list.add(result);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return list;
	}

	
	// 페이지수
	public int selectTotalRowCount(Connection conn) {
	    int count = 0;
	    String sql = "SELECT COUNT(*) FROM BOARD_T";
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	    try {
	        pstmt = conn.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            count = rs.getInt(1);
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close(rs);
	        close(pstmt);
	    }
	    return count;
	}

	
	
	// 게시판 상세내용
	public List<BoardVo> boardDetail(Connection conn, int bno) {
		BoardVo result = null; // 결과값을 저장하기 위한 result
		String sql = "select BOARD_NO, WRITER, PWD, TITLE, CONTENT, REGDATE, CATEGORY from BOARD_T where board_no=?";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		List<BoardVo> list = new ArrayList<BoardVo>(); // 게시판 목록 담을 list
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				result = new BoardVo();
				result.setBoard_no(rs.getInt(1));
				result.setWriter(rs.getString(2));
				result.setPwd(rs.getString(3));
				result.setTitle(rs.getString(4));
				result.setContent(rs.getString(5));
				result.setRegdate(rs.getTimestamp(6));
				result.setCategory(rs.getInt(7));
				list.add(result);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		return list;
	}
	
	// 최대 게시판 번호 알아내기
	public int getNo(Connection conn) {
		int result = 0;
		String sql = "SELECT NVL(max(BOARD_NO), 0) + 1 FROM BOARD_T";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(rs);
			close(pstmt);
		}
		System.out.println(result);
		return -1;
	}
	
	
	
	// 게시판 작성()
	public int Writing(Connection conn, BoardVo vo) {
		int result = -1;
		String sql = "INSERT INTO BOARD_T VALUES(?,?,?,?,?,CURRENT_TIMESTAMP,?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, new BoardDao().getNo(conn));
			pstmt.setString(2, vo.getWriter());
			pstmt.setString(3, vo.getPwd());
			pstmt.setString(4, vo.getTitle());
			pstmt.setString(5, vo.getContent());
			pstmt.setInt(6, vo.getCategory());
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	
	// 댓글 목록
	public List<BoardVo> replyList(Connection conn, int bno) {
		List<BoardVo> result = null;
		String sql = "select BOARD_NO, REPLY_NO, REPLY_WRITER, REPLY_REGDATE, REPLY_CONTENT, REPLY_PWD from reply where BOARD_NO=? ORDER BY REPLY_NO ASC";
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bno);
			rs = pstmt.executeQuery();			
			// 다중행
			result = new ArrayList<BoardVo>();
			while(rs.next()) {
				BoardVo vo = new BoardVo();
				vo.setBoard_no(rs.getInt("board_no"));
				vo.setReply_no(rs.getInt("reply_no"));
				vo.setReply_writer(rs.getString("reply_writer"));
				vo.setReply_regdate(rs.getTimestamp("reply_regdate"));
				vo.setReply_content(rs.getString("reply_content"));
				vo.setReply_pwd(rs.getString("reply_pwd"));
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
	
	
	
	// 게시판 수정
	public int update(Connection conn, BoardVo vo) {
		int result = -1;
		String sql = "update BOARD_T set TITLE =?, CONTENT=?, CATEGORY=? where PWD =? and board_no=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getTitle());
			pstmt.setString(2, vo.getContent());
			pstmt.setInt(3, vo.getCategory());
			pstmt.setString(4, vo.getPwd());
			pstmt.setInt(5, vo.getBoard_no());
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 게시판 삭제
	public int delete(Connection conn, BoardVo vo) {
		int result = -1;
		String sql = "delete from board_t where BOARD_NO=? and PWD=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBoard_no());
			pstmt.setString(2, vo.getPwd());
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 댓글 추가
	public int replyAdd(Connection conn, BoardVo vo) {
		int result = -1;
		String sql = "INSERT INTO REPLY VALUES(?, (select NVL(MAX(REPLY_NO),0)+1 from REPLY), ?, CURRENT_TIMESTAMP, ?, ?)";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, vo.getBoard_no());
			pstmt.setString(2, vo.getReply_writer());
			pstmt.setString(3, vo.getReply_content());
			pstmt.setString(4, vo.getReply_pwd());
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 댓글 삭제
	public int replyDelete(Connection conn, int reply_no, String reply_pwd) {
		int result = -1;
		String sql = "delete from REPLY where REPLY_NO=? and REPLY_PWD=?";
		System.out.println("여기역" + reply_no);
		System.out.println("여기역" + reply_pwd);
		
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, reply_no);
			pstmt.setString(2, reply_pwd);
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
	
	// 댓글 수정
	public int replyUpdate(Connection conn, BoardVo vo) {
		System.out.println("댓글수정" + vo);
		int result = -1;
		String sql = "update REPLY set REPLY_CONTENT=? where REPLY_NO =? and REPLY_PWD=?";
		PreparedStatement pstmt = null;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getReply_content());
			pstmt.setInt(2, vo.getReply_no());
			pstmt.setString(3, vo.getReply_pwd());
			result = pstmt.executeUpdate();
			System.out.println(result);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

}
