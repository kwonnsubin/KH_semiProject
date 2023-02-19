package kh.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kh.board.model.service.BoardService;
import kh.board.model.vo.BoardVo;
import kh.member.model.vo.MemberVo;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class BoardDetailController
 */
@WebServlet("/boardDetail")
public class BoardDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1
		String board_no = request.getParameter("board_no");
		int bno = Integer.parseInt(board_no);
		System.out.println(bno);
		
		// 게시판 목록
		List<BoardVo> result1 = null;
		List<BoardVo> result2 = null;
		result1 = new BoardService().boardDetail(bno);
		result2 = new BoardService().replyList(bno);
		System.out.println(result2);
		request.setAttribute("boardList", result1);
		request.setAttribute("replyList", result2);
		request.getRequestDispatcher("/WEB-INF/view/board/boardDetail.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 댓글 작성
		BoardVo vo = new BoardVo();
		String board_no = request.getParameter("board_no");
		int bno = Integer.parseInt(board_no);
		
		if(request.getSession().getAttribute("lgnss") != null) { // 로그인이 되어있으면
			vo.setBoard_no(bno);
			vo.setReply_content(request.getParameter("reply_content"));
			vo.setReply_writer(((MemberVo)(request.getSession().getAttribute("lgnss"))).getNickname());
			vo.setReply_pwd(((MemberVo)(request.getSession().getAttribute("lgnss"))).getPwd());

//			vo.setTitle(request.getParameter("title"));
//			vo.setCategory(Integer.parseInt(request.getParameter("category")));			
//			vo.setWriter(((MemberVo)(request.getSession().getAttribute("lgnss"))).getNickname());
//			vo.setPwd(((MemberVo)(request.getSession().getAttribute("lgnss"))).getPwd());
//			vo.setContent(request.getParameter("content"));
			//2. DB다녀오기
			int result = new BoardService().replyAdd(vo);
			if(result < 1) {
				System.out.println("댓글쓰기 실패");
			} else {
				System.out.println("댓글쓰기 성공");
				response.sendRedirect(request.getContextPath()+"/board");
			}
			

		} else { // 로그인이 안되어있으면
			vo.setBoard_no(bno);
			vo.setReply_content(request.getParameter("reply_content"));
			vo.setReply_writer(request.getParameter("writer"));
			vo.setReply_pwd(request.getParameter("pwd"));
//			vo.setTitle(request.getParameter("title"));
//			vo.setCategory(Integer.parseInt(request.getParameter("category")));
//			vo.setWriter(request.getParameter("writer"));
//			vo.setContent(request.getParameter("content"));
//			vo.setPwd(request.getParameter("pwd"));
			//2. DB다녀오기
			int result = new BoardService().replyAdd(vo);
			if(result < 1) {
				System.out.println("댓글쓰기 실패");
			} else {
				System.out.println("댓글쓰기 성공");
				response.sendRedirect(request.getContextPath()+"/board");
			}
		}
	}
}
