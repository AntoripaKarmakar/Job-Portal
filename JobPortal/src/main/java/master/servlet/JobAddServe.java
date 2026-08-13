package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import master.dao.JobDao;
import master.dto.JobDto;
import master.dto.UserDto;

@WebServlet("/JobAddServe")
public class JobAddServe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	// Show add-job.jsp form
	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		request.getRequestDispatcher("add-job.jsp").forward(request, response);
	}

	// Handle form submission
	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		// Fetch parameters from request
		String title = request.getParameter("title");
		String description = request.getParameter("description");
		String location = request.getParameter("location");
		String company = request.getParameter("company");
		int salary = Integer.parseInt(request.getParameter("salary"));
		boolean isRemote = Boolean.parseBoolean(request.getParameter("isRemote"));
		
		// Get user ID from session
		HttpSession session = request.getSession(false);
		if (session == null || session.getAttribute("user") == null) {
			// Not logged in; Redirect to Seeker Login
			response.sendRedirect("RecruiterLogin.jsp");
			return;
		}
		
		UserDto user = (UserDto) session.getAttribute("user");
		int uid = user.getUid();

		// Create JobDto object
		JobDto job = new JobDto();
		job.setTitle(title);
		job.setDescription(description);
		job.setLocation(location);
		job.setCompany(company);
		job.setSalary(salary);
		job.setRemote(isRemote);
		job.setUid(uid);

		// Save job using DAO
		JobDao jdao = new JobDao();
		jdao.addJob(job);

		// Redirect to job list
		response.sendRedirect("JobListServlet?dest=recruiter");
	}
}