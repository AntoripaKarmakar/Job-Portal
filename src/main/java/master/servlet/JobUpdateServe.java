package master.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import master.dao.JobDao;
import master.dto.JobDto;

@WebServlet("/JobUpdateServe")
public class JobUpdateServe extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // POST → verify/update by jid only, then redirect
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int jid = Integer.parseInt(request.getParameter("jid"));

        JobDto jdto = new JobDto();
        jdto.setJid(jid);

        JobDao jdao = new JobDao();
        jdao.verifyJob(jdto); // DAO updates is_verified by jid

        response.sendRedirect("JobListServlet?dest=admin");
    }
}