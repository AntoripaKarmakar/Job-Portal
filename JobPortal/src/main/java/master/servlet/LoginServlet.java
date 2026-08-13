package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import master.dao.UserDao;
import master.dto.UserDto;
import master.utilities.PasswordUtil;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			UserDao udao = new UserDao();
			
			String email = request.getParameter("email");
			String pswd = request.getParameter("password");
			
			if (email.equals("admin@carriernest.com") && pswd.equals("admin123")) {
				 HttpSession session = request.getSession();
			    session.setAttribute("role", "admin");
			    
			    // Create a dummy UserDto for consistency
			    UserDto adminUser = new UserDto();
			    adminUser.setName("Admin");
			    adminUser.setEmail(email);
			    adminUser.setRole("admin");
			    session.setAttribute("user", adminUser);

			    response.sendRedirect("JobListServlet?dest=admin");
			    return;
			} else {
			
				String password = PasswordUtil.hashPassword(pswd);
				UserDto user = udao.getUser(email, password);
				
				if (user != null) {
					// Store user info in session
					request.getSession().setAttribute("user", user);
					request.getSession().setAttribute("role", user.getRole());
					
					// Redirect user based on role
					switch (user.getRole()) {
						case "recruiter":
							response.sendRedirect("RecruiterMain.jsp");
							break;
						case "seeker":
							response.sendRedirect("JobListServlet?dest=seeker");
							break;
						default:
							response.sendRedirect("error.jsp?error=unknownrole");
							break;
					}
				} else {
					// Invalid login credentials
					response.sendRedirect("error.jsp?error=invalidcreds");
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Failed to log in.");
		}
	}

}
