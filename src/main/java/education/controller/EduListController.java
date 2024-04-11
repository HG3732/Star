package education.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import education.model.service.EduListService;

/**
 * Servlet implementation class EduListController
 */
@WebServlet("/edu/list")
public class EduListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private EduListService service = new EduListService();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EduListController() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String searchSubject = request.getParameter("edu-name");
//		request.setAttribute("eduList", service.selectList());
//		request.setAttribute("eduSubject", searchSubject);
		
		int pageSize = 9; // 한 페이지 당 9개씩
		int pageBlockSize = 5; // 화면 하단 페이지 수 5씩
		int currentPageNum = 1; // 기본 페이지 1페이지
		String pageNum = request.getParameter("page");
		if(pageNum != null && !pageNum.equals("")) {
			try {
				currentPageNum = Integer.parseInt(pageNum);
			} catch (NumberFormatException e) {
				 e.printStackTrace();
			}
		}
		request.setAttribute("map", service.selectPageList(pageSize, pageBlockSize, currentPageNum));
		
		request.getRequestDispatcher("/WEB-INF/views/edu/edulist.jsp").forward(request, response);
	}

}
