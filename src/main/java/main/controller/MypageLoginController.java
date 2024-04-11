package main.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.model.dto.MemberDto;
import member.model.dto.MemberInfoDto;
import member.vo.service.MemberService;

@WebServlet("/mypagelogin")
public class MypageLoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private MemberService service = new MemberService();
	
    public MypageLoginController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pw = request.getParameter("pw");
		MemberDto resultInfo = null;
		
		// 성공 : 1
		// 실패 : 0
		int result = 0;
		resultInfo = service.MypageLoginDto(pw);
		MemberInfoDto checkUser = (MemberInfoDto)request.getAttribute("ssslogin");
		if(resultInfo != null && resultInfo.getMem_id() == checkUser.getMem_id()) {
			//성공
			request.getSession().setAttribute("ssslogin2", resultInfo);
			result = 1;
		}
		response.getWriter().append(String.valueOf(result));
	
	}
}
