package kh.recycle.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kh.home.model.vo.RecycleVo;
import kh.recycle.model.service.RecycleService;

import java.io.IOException;
import java.util.List;

/**
 * Servlet implementation class recycleDetail
 */
@WebServlet("/recycleDetail")
public class recycleDetailController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public recycleDetailController() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int recycleCode = Integer.parseInt(request.getParameter("recycleCode"));
		List<RecycleVo> result = new RecycleService().recycleDetail(recycleCode);
		
		request.setAttribute("data", result);
		response.sendRedirect(request.getContextPath()+"/recycleDetail");
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int recycleCode = Integer.parseInt(request.getParameter("recycleCode"));
		List<RecycleVo> result = new RecycleService().recycleDetail(recycleCode);
		
		request.setAttribute("data", result);
		response.sendRedirect(request.getContextPath()+"/recycleDetail");
	}

}
