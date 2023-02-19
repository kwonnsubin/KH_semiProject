package kh.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kh.board.model.service.BoardService;
import kh.board.model.vo.BoardVo;
import kh.member.model.service.MemberService;
import kh.member.model.vo.MemberVo;

import java.io.IOException;

/**
 * Servlet implementation class BoardWriting
 */
@WebServlet("/boardWriting")
public class BoardWritingController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardWritingController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/board/boardWriting.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardVo vo = new BoardVo();
		//1
		if(request.getSession().getAttribute("lgnss") != null) { // 로그인이 되어있으면

			vo.setTitle(request.getParameter("title"));
			vo.setCategory(Integer.parseInt(request.getParameter("category")));			
			vo.setWriter(((MemberVo)(request.getSession().getAttribute("lgnss"))).getNickname());
			vo.setPwd(((MemberVo)(request.getSession().getAttribute("lgnss"))).getPwd());
			vo.setContent(request.getParameter("content"));
			//2. DB다녀오기
			int result = new BoardService().Writing(vo);
			if(result < 1) {
				System.out.println("글쓰기 실패");
			} else {
				System.out.println("글쓰기 성공");
				response.sendRedirect(request.getContextPath()+"/board");
			}
			

		} else { // 로그인이 안되어있으면
			vo.setTitle(request.getParameter("title"));
			vo.setCategory(Integer.parseInt(request.getParameter("category")));
			vo.setWriter(request.getParameter("writer"));
			vo.setContent(request.getParameter("content"));
			vo.setPwd(request.getParameter("pwd"));
			//2. DB다녀오기
			int result = new BoardService().Writing(vo);
			if(result < 1) {
				System.out.println("글쓰기 실패");
			} else {
				System.out.println("글쓰기 성공");
				response.sendRedirect(request.getContextPath()+"/board");
			}
		}
		
	}

}
