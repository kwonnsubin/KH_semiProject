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

/**
 * Servlet implementation class ReplyUpdateController
 */
@WebServlet("/replyUpdate")
public class ReplyUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/board/replyUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시판 수정
		BoardVo vo = new BoardVo();
		if(request.getSession().getAttribute("lgnss") != null) { // 로그인이 되어있으면
			
			vo.setReply_no(Integer.parseInt(request.getParameter("reply_no")));		
			vo.setReply_pwd(((MemberVo)(request.getSession().getAttribute("lgnss"))).getPwd());
			vo.setReply_content(request.getParameter("reply_content"));
			//2. DB다녀오기
			int result = new BoardService().replyUpdate(vo);
			if(result < 1) {
				System.out.println("댓글수정 실패");
			} else {
				System.out.println("댓글수정 성공");
				response.sendRedirect(request.getContextPath()+"/board");
			}
			

		} else { // 로그인이 안되어있으면
			vo.setReply_no(Integer.parseInt(request.getParameter("reply_no")));	
			vo.setReply_pwd(request.getParameter("reply_pwd"));
			vo.setReply_content(request.getParameter("reply_content"));
			//2. DB다녀오기
			int result = new BoardService().replyUpdate(vo);
			if(result < 1) {
				System.out.println("댓글수정 실패");
			} else {
				System.out.println("댓글수정 성공");
				response.sendRedirect(request.getContextPath()+"/board");
			
			}
	
		}
	}
}
