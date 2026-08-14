package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.dao.JobDao;
import master.dto.JobDto;

@WebServlet("/DeleteJobServlet")
public class JobDeleteServe extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // get jid param
        int jid = Integer.parseInt(request.getParameter("jid"));

        // wrap into dto
        JobDto jdto = new JobDto();
        jdto.setJid(jid);

        // dao call
        JobDao jdao = new JobDao();
        jdao.deleteJob(jdto);

        // redirect to list
        response.sendRedirect("RecruiterMain.jsp");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doPost(request, response);
    }
}