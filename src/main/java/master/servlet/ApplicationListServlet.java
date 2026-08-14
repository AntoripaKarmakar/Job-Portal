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
 * Servlet implementation class ApplicationListServlet
 */
@WebServlet("/ApplicationListServlet")
public class ApplicationListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Check if user is logged in
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			// Not logged in; Redirect to Recruiter Login
			response.sendRedirect("RecruiterLogin.jsp");
		}
		
		// Get job ID from request parameters
		int jid = Integer.parseInt(request.getParameter("jid"));
		
		// Get applications of current user
		ApplDao adao = new ApplDao();
		List<ApplDto> appls = adao.getApplicationsByJob(jid);
		
		// Put appls in the request scope
		request.setAttribute("applications", appls);
		
		// Forward to JSP
		request.getRequestDispatcher("JobApplications.jsp").forward(request, response);
	}

}
