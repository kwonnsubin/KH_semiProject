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
 * Servlet implementation class BoardDeleteController
 */
@WebServlet("/boardDelete")
public class BoardDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.getRequestDispatcher("/WEB-INF/view/board/boardDelete.jsp").forward(request, response);
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardVo vo = new BoardVo();
		if(request.getSession().getAttribute("lgnss") != null) { // 로그인이 되어있으면
			
			vo.setBoard_no(Integer.parseInt(request.getParameter("board_no")));	
			vo.setPwd(((MemberVo)(request.getSession().getAttribute("lgnss"))).getPwd());
			//2. DB다녀오기
			int result = new BoardService().delete(vo);
			if(result < 1) {
				System.out.println("삭제 성공");
			} else {
				System.out.println("삭제 실패");
				response.sendRedirect(request.getContextPath()+"/board");
			}
			
		} else { // 로그인이 안되어있으면
			vo.setBoard_no(Integer.parseInt(request.getParameter("board_no")));
			vo.setPwd(request.getParameter("pwd"));
			//2. DB다녀오기
			int result = new BoardService().delete(vo);
			if(result < 1) {
				System.out.println("삭제 실패");
			} else {
				System.out.println("삭제 성공");
				response.sendRedirect(request.getContextPath()+"/board");
			}
		
		}
	}

}
