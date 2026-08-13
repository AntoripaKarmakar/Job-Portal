package master.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import master.dao.JobDao;
import master.dto.JobDto;
import master.dto.UserDto;

/**
 * Servlet implementation class JobListServlet
 */
@WebServlet("/JobListServlet")
public class JobListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			// Get user ID from session
			HttpSession session = request.getSession(false);
			if (session == null || session.getAttribute("user") == null) {
				// Not logged in; Redirect to Seeker Login
				response.sendRedirect("SeekerLogin.jsp");
				return;
			}
			
			UserDto user = (UserDto) session.getAttribute("user");
			int uid = user.getUid();
			
			// Create new DAO instance
			JobDao jdao = new JobDao();
			
			// Fetch all jobs
			List<JobDto> jobs = jdao.getJobs();
			
			// Get where to forward to
			String dest = request.getParameter("dest");
			
			if ("recruiter".equals(dest)) {
			    List<JobDto> recruiterJobs = new ArrayList<>();
			    for (JobDto job : jobs) {
			        if (job.getUid() == uid) {
			            recruiterJobs.add(job);
			        }
			    }
			    jobs = recruiterJobs; // overwrite the list with filtered one
			} else if ("adminverified".equals(dest)) {
			    List<JobDto> verifiedJobs = new ArrayList<>();
			    for (JobDto job : jobs) {
			        if (job.isVerified() == true) {
			            verifiedJobs.add(job);
			        }
			    }
			    jobs = verifiedJobs; // overwrite the list with filtered one
			}
			
			// Put jobs into request scope
			request.setAttribute("jobs", jobs);
			
			// Forward to JSP
			switch (dest) {
				case "seeker":
					request.getRequestDispatcher("ViewJob.jsp").forward(request, response);
					break;
				case "recruiter":
					request.getRequestDispatcher("ViewJobRecruiter.jsp").forward(request, response);
					break;
				case "admin":
					request.getRequestDispatcher("AdminLanding.jsp").forward(request, response);
					break;
				case "adminverified":
					request.getRequestDispatcher("AdminLanding.jsp").forward(request, response);
					break;
				default:
					request.getRequestDispatcher("error.jsp?error=unknownrole");
					break;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Unable to fetch jobs.");
		}
	}

}
