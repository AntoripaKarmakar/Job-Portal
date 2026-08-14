package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.dao.UserDao;
import master.dto.UserDto;
import master.utilities.PasswordUtil;

/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class SignupServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			UserDao udao = new UserDao();
			
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String password = PasswordUtil.hashPassword(request.getParameter("password"));
			String role = request.getParameter("role");
			
			UserDto udto = new UserDto();
			udto.setName(name);
			udto.setEmail(email);
			udto.setPassword(password);
			udto.setRole(role);
			
			int rows = udao.addUser(udto);
			
			if (rows > 0) {
				// Get full user info
				UserDto user = udao.getUser(email, password);
				
				// Add user info to session
				request.getSession().setAttribute("user", user);
				request.getSession().setAttribute("role", user.getRole());
				
				// Redirect user according to role
				switch (role) {
					case "recruiter":
						response.sendRedirect("RecruiterMain.jsp");
						break;
					case "seeker":
						response.sendRedirect("JobListServlet?dest=seeker");
						break;
					default:
						response.sendRedirect("error.jsp?error=invalidrole");
						break;
				}
			} else {
				// Signup error
				response.sendRedirect("error.jsp?error=signupfailed");
			}
			
		} catch (Exception e) {
			e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to sign up.");
		}
	}

}
