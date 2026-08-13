package master.servlet;

import java.io.IOException;
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
 * Servlet implementation class ApplyServlet
 */
@WebServlet("/ApplyServlet")
public class ApplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Read request parameters
		int jid = Integer.parseInt(request.getParameter("jid"));
		String eduWorkDet = request.getParameter("edu_work_det");
		int experience = Integer.parseInt(request.getParameter("experience"));
		String coverLetter = request.getParameter("cover_letter");
		
		// Get user ID from session
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			// Not logged in; Redirect to Seeker Login
			response.sendRedirect("SeekerLogin.jsp");
			return;
		}
		
		UserDto user = (UserDto) session.getAttribute("user");
		int uid = user.getUid();
		
		// Insert application to the database
		ApplDto adto = new ApplDto();
		adto.setJid(jid);
		adto.setUid(uid);
		adto.setEduWorkDet(eduWorkDet);
		adto.setExperience(experience);
		adto.setCoverLetter(coverLetter);
		
		ApplDao adao = new ApplDao();
		int rows = adao.applyJob(adto);
		
		if (rows > 0) {
			// Application successful
			response.sendRedirect("MyApplicationServlet");
		} else {
			// Application error
			response.sendRedirect("error.jsp?error=jobapplicationerror");
		}
	}

}
