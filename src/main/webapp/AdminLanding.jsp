<%@page import="master.dto.UserDto"%>
<%@page import="master.dto.JobDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:include page="AdminNav.jsp"></jsp:include>

<%
    UserDto user = (UserDto) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("AdminLogin.jsp");
        return;
    } else if (!"admin".equalsIgnoreCase(user.getRole())) {
        // Redirect to their default landing page
        if ("recruiter".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("RecruiterMain.jsp");
        } else if ("seeker".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("JobListServlet?dest=seeker");
        }
        return;
    }
%>

<%
List<JobDto> jobs = (List<JobDto>) request.getAttribute("jobs");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Admin - All Jobs</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <style>
        body {
            background-color: #f9f9f9;
            padding-top: 80px;
        }
        .job-card {
            background: #fff;
            border-radius: 12px;
            padding: 20px;
            margin-bottom: 15px;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
            transition: transform 0.2s ease-in-out;
        }
        .job-card:hover {
            transform: translateY(-3px);
        }
        .verify-btn {
            min-width: 100px;
            border-radius: 25px;
        }
    </style>
</head>
<body>

<div class="container mt-4">
    <h3 class="fw-bold mb-4">All Job Listings</h3>

    <% if (jobs != null && !jobs.isEmpty()) {
           for (JobDto job : jobs) { %>
        <div class="job-card d-flex justify-content-between align-items-center mb-3 p-3 border rounded">
            <div>
                <h6 class="mb-1 fw-semibold"><%= job.getCompany() %></h6>
                <h5 class="fw-bold"><%= job.getTitle() %></h5>
                <small class="text-muted">
                    <%= job.getLocation() %>
                    • <%= job.isRemote() ? "Remote" : "On-site" %>
                    • Poster <%= job.getPostedAt() %>
                </small>
            </div>
            <div>
                <% if (!job.isVerified()) { %>
                    <form action="JobUpdateServe" method="post" class="d-inline">
                        <input type="hidden" name="jid" value="<%= job.getJid() %>" />
                        <button type="submit" class="btn btn-dark verify-btn">Verify</button>
                    </form>
                <% } else { %>
                    <i class="bi bi-check-circle-fill text-success fs-4"></i>
                <% } %>
            </div>
        </div>
    <%   }
       } else { %>
        <p class="text-muted">No job listings available.</p>
    <% } %>

    
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
