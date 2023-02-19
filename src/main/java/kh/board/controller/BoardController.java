package kh.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kh.board.model.service.BoardService;
import kh.board.model.vo.BoardVo;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class BoardController
 */
@WebServlet("/board")
public class BoardController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public BoardController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//1
		//2 DB다녀오기
		List<BoardVo> result = null;
		result = new BoardService().boardList();
		System.out.println(result);
		request.setAttribute("boardList", result);
		request.getRequestDispatcher("/WEB-INF/view/board/board.jsp").forward(request, response);
	}

}
