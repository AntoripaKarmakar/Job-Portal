package master.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import master.dao.ApplDao;
import master.dto.ApplDto;
import master.dto.UserDto;

/**
 * Servlet implementation class MyApplicationServlet
 */
@WebServlet("/MyApplicationServlet")
public class MyApplicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get user ID from session
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			// Not logged in; Redirect to Seeker Login
			response.sendRedirect("SeekerLogin.jsp");
			return;
		}
		
		UserDto user = (UserDto) session.getAttribute("user");
		int uid = user.getUid();
		
		// Get applications of current user
		ApplDao adao = new ApplDao();
		List<ApplDto> appls = adao.getApplicationsByUser(uid);
		
		// Put appls in the request scope
		request.setAttribute("applications", appls);
		
		// Forward to JSP
		request.getRequestDispatcher("ViewApplications.jsp").forward(request, response);
	}

}
