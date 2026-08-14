package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.dao.JobDao;
import master.dto.JobDto;

@WebServlet("/JobDetailsServe")
public class JobDetailsServe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {

		response.setContentType("text/html");

		// Get jid from request
		int jid = Integer.parseInt(request.getParameter("jid"));

		// Pass jid through JobDto
		JobDto jdto = new JobDto();
		jdto.setJid(jid);

		JobDao jdao = new JobDao();
		JobDto job = jdao.getJobById(jdto);

		// Set as request attribute
		request.setAttribute("job", job);
		
		// Get destination to forward to
		String dest = request.getParameter("dest");

		// Forward to JSP
		switch (dest) {
			case "seeker":
				request.getRequestDispatcher("JobDetailsSeeker.jsp").forward(request, response);
				break;
			case "recruiter":
				request.getRequestDispatcher("JobDetailsRecruiter.jsp").forward(request, response);
				break;
			case "admin":
				request.getRequestDispatcher("JobDetailsRecruiter.jsp").forward(request, response);
				break;
			default:
				request.getRequestDispatcher("error.jsp?error=unknownrole");
				break;
		}
	}
}