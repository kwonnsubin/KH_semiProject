package kh.member.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kh.member.model.service.EnrollService;
import kh.member.model.vo.MemberVo;

import java.io.IOException;

/**
 * Servlet implementation class EnrollController
 */
@WebServlet("/enroll")
public class EnrollController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EnrollController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/view/member/enroll.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//1. 데이터 꺼내기
		MemberVo vo = new MemberVo();
		vo.setEmail(request.getParameter("email"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setPwdcheck(request.getParameter("pwdcheck"));
		vo.setNickname(request.getParameter("nickname"));
		

		//2. DB 다녀오기
		if(vo.getPwd().equals(vo.getPwdcheck())) {
			int result = new EnrollService().enroll(vo);			
			if(result < 1) {
				System.out.println("회원가입실패");
			} else {
				System.out.println("회원가입성공");
				response.sendRedirect(request.getContextPath()+"/");
			}
		} else {
			System.out.println("비밀번호 틀림");
		}
	}
	
	
}
