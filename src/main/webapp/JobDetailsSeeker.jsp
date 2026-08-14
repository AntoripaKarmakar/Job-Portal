<%@page import="master.dto.UserDto"%>
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

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Job Details</title>
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
    .apply-btn {
      display: flex;
      justify-content: center;
      margin: 30px 0;
    }
  </style>
</head>
<body>

<div class="container">

  <!-- Job Header -->
  <div class="job-header">
    <h2>${job.title}</h2>
    <h5 class="text-muted mb-3">${job.company}</h5>
    <div class="meta-badges mb-3">
      <span class="badge bg-secondary">Location: ${job.location}</span>
      <span class="badge bg-info text-dark">Salary: ₹${job.salary}</span>
      <span class="badge ${job.remote ? 'bg-success' : 'bg-danger'}">
        Remote: ${job.remote ? 'Yes' : 'No'}
      </span>
      <span class="badge ${job.verified ? 'bg-success' : 'bg-warning'}">
        ${job.verified ? 'Verified' : 'Not Verified'}
      </span>
    </div>
  </div>

  <!-- Job Description Section -->
  <div class="section-box">
    <h5 class="fw-bold mb-3">About the Role</h5>
    <p>
      ${job.description}
    </p>
  </div>

  <!-- Extra Info Section -->
  <div class="section-box">
    <h5 class="fw-bold mb-3">Job Details</h5>
    <ul>
      <li><strong>Title:</strong> ${job.title}</li>
      <li><strong>Company:</strong> ${job.company}</li>
      <li><strong>Location:</strong> ${job.location}</li>
      <li><strong>Salary:</strong> ₹${job.salary}</li>
      <li><strong>Remote:</strong> ${job.remote ? 'Yes' : 'No'}</li>
      <li><strong>Verified:</strong> ${job.verified ? 'Yes' : 'No'}</li>
    </ul>
  </div>
  
  <!-- Application Form Section -->
  <div class="section-box" id="apply">
    <h5 class="fw-bold mb-3">Apply for this Job</h5>
    <p>You are applying for <strong>${job.title}</strong> at <strong>${job.company}</strong>.</p>

    <form action="ApplyServlet?jid=${job.jid}" method="post">
      <div class="mb-3">
        <label for="edu_work_det" class="form-label">Education & Work Details</label>
        <textarea class="form-control" id="edu_work_det" name="edu_work_det" rows="3" required></textarea>
      </div>

      <div class="mb-3">
        <label for="experience" class="form-label">Experience</label>
        <input type="number" class="form-control" id="experience" name="experience" required>
      </div>

      <div class="mb-3">
        <label for="cover_letter" class="form-label">Cover Letter (Optional)</label>
        <textarea class="form-control" id="cover_letter" name="cover_letter" rows="4"></textarea>
      </div>

      <button type="submit" class="btn btn-primary">Submit Application</button>
    </form>
  </div>

</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
