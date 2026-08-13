<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="master.dto.JobDto"%>
<%@page import="master.dto.ApplDto"%>
<%@page import="master.dto.UserDto"%>
<%@page import="master.dao.ApplDao"%>
<%@page import="master.dao.UserDao"%>

<jsp:include page="RecruiterNav.jsp"></jsp:include>

<%
    UserDto userObj = (UserDto) session.getAttribute("user");
    if (userObj == null) {
        response.sendRedirect("RecruiterLogin.jsp");
        return;
    } else if (!"recruiter".equalsIgnoreCase(userObj.getRole())) {
        // Redirect to their default landing page
        if ("seeker".equalsIgnoreCase(userObj.getRole())) {
            response.sendRedirect("JobListServlet?dest=seeker");
        } else if ("admin".equalsIgnoreCase(userObj.getRole())) {
            response.sendRedirect("JobListServlet?dest=admin");
        }
        return;
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Job Details (Recruiter)</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #f9f9f9;
      padding-top: 70px;
      font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
    }
    .job-header {
      background: #fff;
      padding: 30px;
      border-radius: 12px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.08);
      margin-bottom: 25px;
    }
    .section-box {
      background: #fff;
      padding: 25px;
      border-radius: 12px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.08);
      margin-bottom: 20px;
    }
    .action-btn {
      display: flex;
      justify-content: center;
      margin: 30px 0;
    }
  </style>
</head>
<body>

<div class="container">

<%
  JobDto job = (JobDto) request.getAttribute("job");
  ApplDao adao = new ApplDao();
  UserDao udao = new UserDao();

%>

  <!-- Job Header -->
  <div class="job-header">
    <h2><%= job.getTitle() %></h2>
    <h5 class="text-muted mb-3"><%= job.getCompany() %></h5>
    <div class="meta-badges mb-3">
      <span class="badge bg-secondary">Location: <%= job.getLocation() %></span>
      <span class="badge bg-info text-dark">Salary: ₹<%= job.getSalary() %></span>
      <span class="badge <%= job.isRemote() ? "bg-success" : "bg-danger" %>">
        Remote: <%= job.isRemote() ? "Yes" : "No" %>
      </span>
      <span class="badge <%= job.isVerified() ? "bg-success" : "bg-warning" %>">
        <%= job.isVerified() ? "Verified" : "Not Verified" %>
      </span>
    </div>
    <p class="text-muted"><%= job.getDescription() %></p>
  </div>

  <!-- Job Details Section -->
  <div class="section-box">
    <h5 class="fw-bold mb-3">Job Details</h5>
    <ul>
      <li><strong>Title:</strong> <%= job.getTitle() %></li>
      <li><strong>Company:</strong> <%= job.getCompany() %></li>
      <li><strong>Location:</strong> <%= job.getLocation() %></li>
      <li><strong>Salary:</strong> ₹<%= job.getSalary() %></li>
      <li><strong>Remote:</strong> <%= job.isRemote() ? "Yes" : "No" %></li>
      <li><strong>Verified:</strong> <%= job.isVerified() ? "Yes" : "No" %></li>
    </ul>
  </div>

  <!-- Applicants List Section -->
  <div class="section-box">
    <h5 class="fw-bold mb-3">Applicants for this Job</h5>

    <%
      List<ApplDto> apps = adao.getApplicationsByJob(job.getJid());
      if (apps == null || apps.isEmpty()) {
    %>
        <p class="text-muted">No one has applied for this job yet.</p>
    <%
      } else {
    %>
        <table class="table table-hover">
          <thead class="table-light">
            <tr>
              <th>#</th>
              <th>Name</th>
              <th>Email</th>
              <th>Experience</th>
              <th>Cover Letter</th>
            </tr>
          </thead>
          <tbody>
          <%
            int index = 1;
            for (ApplDto app : apps) {
              UserDto udto = new UserDto();
              udto.setUid(app.getUid());
              UserDto user = udao.getUserById(udto);
          %>
              <tr>
                <td><%= index++ %></td>
                <td><%= user.getName() %></td>
                <td><%= user.getEmail() %></td>
                <td><%= app.getExperience() %> years</td>
                <td><%= app.getCoverLetter() != null ? app.getCoverLetter() : "-" %></td>
              </tr>
          <%
            }
          %>
          </tbody>
        </table>
    <%
      
    %>
  </div>

  <!-- Delete Button -->
  <div class="action-btn">
    <a href="DeleteJobServlet?jid=<%= job.getJid() %>" class="btn btn-danger btn-lg px-5">Delete</a>
  </div>

<%
     // end for
    } // end else
%>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
