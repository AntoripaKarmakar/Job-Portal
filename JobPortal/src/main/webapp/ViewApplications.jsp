<%@page import="master.dto.UserDto"%>
<%@page import="master.dao.JobDao"%>
<%@page import="master.dao.ApplDao"%>
<%@page import="master.dto.JobDto"%>
<%@page import="java.util.List"%>
<%@page import="master.dto.ApplDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="SeekerNav.jsp"></jsp:include>

<%
    UserDto user = (UserDto) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("SeekerLogin.jsp");
        return;
    } else if (!"seeker".equalsIgnoreCase(user.getRole())) {
        // Redirect to their default landing page
        if ("recruiter".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("RecruiterMain.jsp");
        } else if ("admin".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("JobListServlet?dest=admin");
        }
        return;
    }
%>

<%
List<ApplDto> appls = (List<ApplDto>) request.getAttribute("applications");
%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Job Application</title>
  <meta name="viewport" content="width=device-width, initial-scale=1">

  <!-- Bootstrap CSS -->
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

  <style>
    body {
      background-color: #f9f9f9;
      padding-top: 70px;
      font-family: system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue", Arial;
    }
    .section-box {
      background: #fff;
      padding: 25px;
      border-radius: 12px;
      box-shadow: 0 2px 6px rgba(0,0,0,0.08);
      margin-bottom: 20px;
    }
    .applicant-card {
      background: #fdfdfd;
      border: 1px solid #e1e1e1;
      padding: 15px;
      border-radius: 10px;
      margin-bottom: 15px;
    }
  </style>
</head>
<body>

<div class="container" style="margin-top: 50px">

  <!-- Applicants List -->
  <div class="section-box">
    <h4 class="fw-bold mb-3">My Applications</h4>

	
	<% if (!appls.isEmpty()) { 
		for(ApplDto a : appls) { %>
		<%
		JobDao jdao = new JobDao();
		JobDto jdto = new JobDto();
		jdto.setJid(a.getJid());
		JobDto job = jdao.getJobById(jdto);
		%>
		
	    <div class="applicant-card">
	      <h5><%= job.getTitle() %> - <%= job.getCompany() %></h5>
	      <p class="text-muted"><%= a.getEduWorkDet() %>, <%= a.getExperience() %></p>
	      <small>Cover Letter: <%= a.getCoverLetter() %></small>
	    </div>
	<% }
	  } else { %>
	  <h5 style="margin-top: 40px">No applications yet!</h5>
	  <p class="text-muted">Apply to jobs you love, and you will see all your applications here.</p>
	<% } %>
	  

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
