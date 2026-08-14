package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import master.dao.ApplDao;

/**
 * Servlet implementation class DeleteApplicationServlet
 */
@WebServlet("/DeleteApplicationServlet")
public class DeleteApplicationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Check if user is logged in
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			// Not logged in; Redirect to Seeker Login
			response.sendRedirect("SeekerLogin.jsp");
		}
				
		// Get application ID from request parameters
		int aid = Integer.parseInt(request.getParameter("aid"));
		
		// Delete application with ID=aid
		ApplDao adao = new ApplDao();
		int rows = adao.deleteApplication(aid);
		
		if (rows > 0) {
			// Deletion successful
			response.sendRedirect("MyApplications.jsp");
		} else {
			// Deletion failed
			response.sendRedirect("error.jsp?error=applicationdeletefailed");
		}
	}

}
