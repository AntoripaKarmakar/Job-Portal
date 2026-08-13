package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.dao.JobDao;
import master.dto.JobDto;

/**
 * Servlet implementation class NewApplicationServe
 */
@WebServlet("/NewApplicationServe")
public class NewApplicationServe extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Get job ID
		int jid = Integer.parseInt(request.getParameter("jid"));
		
		// Get job details
		JobDao jdao = new JobDao();
		JobDto jdto = new JobDto();
		jdto.setJid(jid);
		JobDto job = jdao.getJobById(jdto);
		
		// Attach job to request scope
		request.setAttribute("job", job);
		
		// Forward to application form
		request.getRequestDispatcher("ApplyForm.jsp").forward(request, response);
	}

}
