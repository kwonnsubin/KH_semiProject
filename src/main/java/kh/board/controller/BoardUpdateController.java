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
 * Servlet implementation class BoardUpdateController
 */
@WebServlet("/boardUpdate")
public class BoardUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/board/boardUpdate.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시판 수정
		BoardVo vo = new BoardVo();
		if(request.getSession().getAttribute("lgnss") != null) { // 로그인이 되어있으면
			
			vo.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
			vo.setTitle(request.getParameter("title"));
			vo.setCategory(Integer.parseInt(request.getParameter("category")));			
			vo.setPwd(((MemberVo)(request.getSession().getAttribute("lgnss"))).getPwd());
			vo.setContent(request.getParameter("content"));
			//2. DB다녀오기
			int result = new BoardService().update(vo);
			if(result < 1) {
				System.out.println("글수정 실패");
			} else {
				System.out.println("글수정 성공");
				response.sendRedirect(request.getContextPath()+"/board");
			}
			

		} else { // 로그인이 안되어있으면
			vo.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
			vo.setTitle(request.getParameter("title"));
			vo.setCategory(Integer.parseInt(request.getParameter("category")));
			vo.setPwd(request.getParameter("pwd"));
			vo.setContent(request.getParameter("content"));
			System.out.println("controller: "+vo.getBoard_no());
			System.out.println("controller: "+vo.getTitle());
			System.out.println("controller: "+vo.getCategory());
			System.out.println("controller: "+vo.getPwd());
			System.out.println("controller: "+vo.getContent());
			
			//2. DB다녀오기
			int result = new BoardService().update(vo);
			if(result < 1) {
				System.out.println("글수정 실패");
			} else {
				System.out.println("글수정 성공");
				response.sendRedirect(request.getContextPath()+"/board");
			}
		
		}
	}
}
