package education.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import education.model.dto.EduBookDto;
import education.model.service.EduService;

/**
 * Servlet implementation class EduDetailController
 */
@WebServlet("/edu/book/list")
public class EduBookListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduService service = new EduService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduBookListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<EduBookDto> eduBookList = service.calendarBookList();
		request.setAttribute("eduBook", eduBookList);
		request.getRequestDispatcher("/WEB-INF/views/edu/edubooklist.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
