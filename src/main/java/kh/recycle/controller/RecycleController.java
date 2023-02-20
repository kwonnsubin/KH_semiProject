package kh.recycle.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import kh.home.model.dao.RecycleDao;
import kh.home.model.vo.RecycleVo;
import kh.recycle.model.service.RecycleService;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;

/**
 * Servlet implementation class RecycleController
 */

// 검색하는 동작을 하는 서블릿
@WebServlet("/recycleSearch")
public class RecycleController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RecycleController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		String result = null;
		RecycleService recycleservice = new RecycleService();
		String recycle_name = request.getParameter("recycle_name");
				
		List<RecycleVo> recycleList = recycleservice.search(recycle_name);
		response.setContentType("application/json;charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print(new Gson().toJson(recycleList));
		out.flush();
		out.close();
	
		}
	}

