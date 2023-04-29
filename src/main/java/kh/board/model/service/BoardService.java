package kh.board.model.service;

import static kh.common.jdbc.JDBCTemplate.close;
import static kh.common.jdbc.JDBCTemplate.getConnection;

import java.sql.Connection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import kh.board.model.dao.BoardDao;
import kh.board.model.vo.BoardVo;
import kh.common.jdbc.JDBCTemplate;
import kh.member.model.dao.MemberDao;
import kh.member.model.vo.MemberVo;
import page.Paging;

public class BoardService {
	
//	// 게시판 목록()
//	public List<BoardVo> boardList() {
//		List<BoardVo> result = null;
//		Connection conn = getConnection();
//		result = new BoardDao().boardList(conn);
//		close(conn);
//		return result;
//	}
	
	// 게시판 상세글
	public List<BoardVo> boardDetail(int bno) {
		List<BoardVo> result = null;
		Connection conn = getConnection();
		result = new BoardDao().boardDetail(conn, bno);
		close(conn);
		return result;
	}
	
	// 게시판 작성
	public int Writing(BoardVo vo) {
		int result = -1;
		Connection conn = getConnection();
		result = new BoardDao().Writing(conn, vo);
		if(result>0) {
			JDBCTemplate.commit(conn);
			
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	// 댓글 목록
	public List<BoardVo> replyList(int bno) {
		List<BoardVo> result = null;
		Connection conn = getConnection();
		result = new BoardDao().replyList(conn, bno);
		close(conn);
		return result;
		
	}
	
	// 게시판 수정
	public int update(BoardVo vo) {
		int result = -1;
		Connection conn = getConnection();
		result = new BoardDao().update(conn, vo);
		close(conn);
		return result;
	}
	
	// 게시판 삭제
	public int delete(BoardVo vo) {
		int result = -1;
		Connection conn = getConnection();
		result = new BoardDao().delete(conn, vo);
		close(conn);
		return result;
		
	}
	
	// 댓글 추가
	public int replyAdd(BoardVo vo) {
		int result = -1;
		Connection conn = getConnection();
		result = new BoardDao().replyAdd(conn, vo);
		close(conn);
		return result;
	}
	
	// 댓글 삭제
	public int replyDelete(int reply_no, String reply_pwd) {
		int result = -1;
		Connection conn = getConnection();
		result = new BoardDao().replyDelete(conn, reply_no, reply_pwd);
		close(conn);
		return result;
		
	}
	
	// 댓글 수정
	public int replyUpdate(BoardVo vo) {
		int result = -1;
		Connection conn = getConnection();
		result = new BoardDao().replyUpdate(conn, vo);
		close(conn);
		return result;
	}
	
	// 페이징
	public Paging getPage(int pNum, int cnt) {
		Connection conn = getConnection();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", (pNum - 1) * cnt + 1);
		map.put("end", pNum * cnt);
		
		BoardDao dao = new BoardDao();
		List<BoardVo> dataList = dao.selectPage(map, conn); // 페이지의 즐겨찾기 목록
		
		int totalRowCount = dao.selectTotalRowCount(conn); // totalRowCount = 전체방명록 개수
		int mod = totalRowCount % cnt == 0 ? 0 : 1; // 전체 개수 / 선택값 -> 11 / 5개 == 1 
		int pageCount = (totalRowCount / cnt) + mod; // pageCount = 1 + 2 : 3page
		
		Paging paging = new Paging(dataList, pNum, pageCount, cnt, 5); // (전체 목록, 현재페이지, 구해서나온페이지수(3page), 옵션값) 그냥 모든 페이징 작업과 관련된 정보들을 다보내.
		close(conn);
		return paging;
	}
}

