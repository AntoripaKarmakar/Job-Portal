<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="master.dto.JobDto" %>
	<jsp:include page="SeekerNav.jsp"></jsp:include>

<%
    JobDto job = (JobDto) request.getAttribute("job");
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Apply for Job</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

<div class="container" style="margin-top: 100px">
    <div class="card shadow-sm">
        <div class="card-body">
            <h4 class="fw-bold mb-3">Apply for Job</h4>

            <!-- Job Info -->
            <div class="mb-4">
                <h5 class="mb-1"><%= job.getTitle() %></h5>
                <p class="mb-1 text-muted"><%= job.getCompany() %></p>
                <small class="text-secondary"><%= job.getLocation() %></small>
            </div>

            <!-- Application Form -->
            <form action="ApplyJobServlet" method="post">
                <input type="hidden" name="jobId" value="<%= job.getJid() %>" />

                <div class="mb-3">
                    <label for="eduWork" class="form-label">Education / Work Details</label>
                    <textarea class="form-control" id="eduWork" name="edu_work_det" rows="3" required></textarea>
                </div>

                <div class="mb-3">
                    <label for="experience" class="form-label">Experience</label>
                    <input type="number" class="form-control" id="experience" name="experience" placeholder="e.g. 2" required>
                </div>

                <div class="mb-3">
                    <label for="coverLetter" class="form-label">Cover Letter (Optional)</label>
                    <textarea class="form-control" id="coverLetter" name="cover_letter" rows="4" placeholder="Write a short note..."></textarea>
                </div>

                <div class="d-flex justify-content-end">
                    <button type="submit" class="btn btn-success px-4">Submit Application</button>
                </div>
            </form>

        </div>
    </div>
</div>

</body>
</html>
