package adm.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import adm.model.service.AdmService;

/**
 * Servlet implementation class AdmDeleteMemberServlet
 */
@WebServlet("/delete.member")
public class AdmDeleteMemberServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdmDeleteMemberServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int memberNo = Integer.parseInt(request.getParameter("memberNo"));
		System.out.println(memberNo);
		
		int result = new AdmService().deleteMember(memberNo);
		System.out.println(result);
		
		if(result > 0) {
			response.sendRedirect("member.adm");
//			request.setAttribute("msg", "성공적으로 삭제되었습니다.");
		} else {
			request.getRequestDispatcher("views/common/errorPage.jsp").forward(request, response);
			request.setAttribute("msg", "회원 삭제에 실패했습니다.");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
