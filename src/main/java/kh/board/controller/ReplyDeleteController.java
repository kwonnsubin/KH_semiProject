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
 * Servlet implementation class ReplyDeleteController
 */
@WebServlet("/replyDelete")
public class ReplyDeleteController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReplyDeleteController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		BoardVo vo = new BoardVo();
		int reply_no =0;
		String reply_pwd = null;
		if(request.getSession().getAttribute("lgnss") != null) { // 로그인이 되어있으면
			
			reply_no = Integer.parseInt(request.getParameter("reply_no"));	
			reply_pwd = ((MemberVo)(request.getSession().getAttribute("lgnss"))).getPwd();
			//2. DB다녀오기
			int result = new BoardService().replyDelete(reply_no, reply_pwd);
			if(result < 1) {
				System.out.println("삭제 성공");
			} else {
				System.out.println("삭제 실패");
				response.sendRedirect(request.getContextPath()+"/board");
			}
			
		} else { // 로그인이 안되어있으면
			reply_no= Integer.parseInt(request.getParameter("reply_no"));
			reply_pwd = request.getParameter("reply_pwd");
			System.out.println("");
			//2. DB다녀오기
			int result = new BoardService().replyDelete(reply_no, reply_pwd);
			if(result < 1) {
				System.out.println("삭제 실패");
			} else {
				System.out.println("삭제 성공");
				response.sendRedirect(request.getContextPath()+"/board");
			}
		
		}
	}

}
