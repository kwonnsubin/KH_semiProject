package kh.board.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import kh.board.model.service.BoardService;
import kh.board.model.vo.BoardVo;
import page.Paging;

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
		
		// 페이징
		String pageNumber = request.getParameter("p");
		int pNum;
		if(pageNumber == null || pageNumber.isEmpty()) {
			pNum = 1;
		} else {
			pNum = Integer.parseInt(pageNumber);
		}
		
		Cookie cookie = null;
		Cookie[] cookies = request.getCookies();
		for(Cookie c: cookies) {
			if(c.getName().equals("cnt")) {
				cookie = c;
			}
		}
		
		String cnt = request.getParameter("cnt");
		if(cnt != null) {
			if(cnt.isEmpty()) {
				if(cookie != null) {
					cnt = cookie.getValue();
				} else {
					cnt = "10"; // 초기값
				}
			}
		} else {
			if(cookie != null) {
				cnt = cookie.getValue();
			} else {
				cnt = "10";
			}
		}
		
		cookie = new Cookie("cnt", cnt);
		cookie.setMaxAge(60 * 60 * 24 * 5);
		response.addCookie(cookie);	

		/* 서비스 호출 */
		BoardService service = new BoardService(); // jsp 페이지가 동작전 먼저 조회를 하도록 한다.
		Paging paging = service.getPage(pNum, Integer.parseInt(cnt));
		
		/* jsp에게 전달 */
		request.setAttribute("paging", paging);
		request.getRequestDispatcher("/WEB-INF/view/board/board.jsp").forward(request, response);
	}

}
