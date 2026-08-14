<%@page import="master.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<jsp:include page="RecruiterNav.jsp"></jsp:include>

<%
    UserDto user = (UserDto) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("RecruiterLogin.jsp");
        return;
    } else if (!"recruiter".equalsIgnoreCase(user.getRole())) {
        // Redirect to their default landing page
        if ("seeker".equalsIgnoreCase(user.getRole())) {
            response.sendRedirect("JobListServlet?dest=seeker");
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
    <title>CarrierNest</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f9f9f9;
        }

        /* Hero Section */
        .hero {
            padding: 100px 20px 60px;
            background: linear-gradient(135deg, #ffffff, #f3f7ff);
        }
        .hero h1 {
            font-weight: 700;
            line-height: 1.3;
        }
        .hero .highlight {
            background: linear-gradient(90deg, #2ecc71, #27ae60);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            font-weight: 800;
        }
        .hero p {
            font-size: 1rem;
            max-width: 500px;
        }
        .hero-img {
            max-width: 420px;
            animation: float 4s ease-in-out infinite;
        }
        @keyframes float {
            0% { transform: translateY(0px); }
            50% { transform: translateY(-15px); }
            100% { transform: translateY(0px); }
        }

        /* Features Section (Carousel replaced with Grid) */
        .features {
            padding: 60px 20px;
            background: #fff;
        }
        .feature-card {
            background: #fff;
            border-radius: 16px;
            padding: 30px 20px;
            text-align: center;
            transition: all 0.3s ease;
            box-shadow: 0 3px 10px rgba(0,0,0,0.05);
        }
        .feature-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 6px 18px rgba(0,0,0,0.1);
        }
        .feature-card i {
            font-size: 2.8rem;
            color: #2ecc71;
            margin-bottom: 15px;
        }
        .feature-card h5 {
            font-weight: 600;
            margin-bottom: 10px;
        }

        /* Job Post Form */
        .job-form-box {
            background: linear-gradient(135deg, #ffffff, #f9f9f9);
            padding: 40px 30px;
            border-radius: 18px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.08);
            margin: 60px auto;
            max-width: 800px;
        }
        .job-form-box h3 {
            font-weight: 700;
            margin-bottom: 25px;
            text-align: center;
            color: #0c243b;
        }
        .job-form-box .form-control, 
        .job-form-box .btn {
            border-radius: 10px;
        }
        .job-form-box button {
            font-size: 1rem;
            font-weight: 600;
            padding: 10px 20px;
        }

        /* Footer */
        .footer {
            padding: 20px 15px;
            background-color: #f8f9fa;
            border-top: 1px solid #ddd;
            font-size: 0.9rem;
            text-align: center;
        }
        .footer a {
            color: #333;
            text-decoration: none;
        }
        .footer a:hover {
            text-decoration: underline;
        }

        /* Responsive Fixes */
        @media (max-width: 768px) {
            .hero {
                text-align: center;
                padding: 70px 15px 40px;
            }
            .hero h1 {
                font-size: 1.8rem;
            }
            .hero-img {
                max-width: 280px;
                margin-top: 20px;
            }
            .job-form-box {
                padding: 25px 20px;
                margin: 30px 15px;
            }
        }
    </style>
</head>
<body>

<!-- Hero Section -->
<section class="hero d-flex align-items-center justify-content-center mt-5">
  <div class="container">
    <div class="row align-items-center">
      <!-- Left Content -->
      <div class="col-lg-6 text-center text-lg-start">
        <h1 class="fw-bold display-5">
          Find, Attract & Hire <br> Top Talent with 
          <span class="highlight">CarrierNest</span>
        </h1>
        <p class="text-muted mt-3">
          Simplify your hiring process with smart tools designed for recruiters. 
          Get the right candidate faster, easier, and cost-effectively.
        </p>
        <div class="mt-4">
          <a href="#post-job" class="btn btn-success px-4 py-2 rounded-pill me-2">Post a Job</a>
          <a href="JobListServlet?dest=recruiter" class="btn btn-outline-primary px-4 py-2 rounded-pill">Hire Applicants</a>
        </div>
      </div>
      <!-- Right Illustration -->
      <div class="col-lg-6 text-center mt-4 mt-lg-0">
        <img src="https://cdn-icons-png.flaticon.com/512/2920/2920244.png" 
             class="img-fluid hero-img" alt="Hiring Illustration">
      </div>
    </div>
  </div>
</section>

<!-- Features Section (Grid instead of Carousel) -->
<section class="features">
  <div class="container">
    <div class="row g-4 text-center">
      <div class="col-md-4">
        <div class="feature-card">
          <i class="bi bi-person-check"></i>
          <h5>Hire Skilled Candidates</h5>
          <p class="text-muted">Get top-skilled candidates for your business and scale faster.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="feature-card">
          <i class="bi bi-briefcase"></i>
          <h5>Relevant Experience</h5>
          <p class="text-muted">Find candidates with the right industry experience to match your needs.</p>
        </div>
      </div>
      <div class="col-md-4">
        <div class="feature-card">
          <i class="bi bi-cash-coin"></i>
          <h5>Budget-friendly Plans</h5>
          <p class="text-muted">Explore affordable hiring plans starting from just ₹200.</p>
        </div>
      </div>
    </div>
  </div>
</section>

<!-- Job Post Form -->
<section id="post-job">
	<div class="container">
	    <div class="job-form-box">
	        <h3>Create a New Job Post</h3>
	        <form action="JobAddServe" method="POST">
	            <div class="row g-3">
	                <div class="col-md-6">
	                    <label class="form-label">Company Name</label>
	                    <input type="text" class="form-control" name="company" placeholder="Company name" required>
	                </div>
	                <div class="col-md-6">
	                    <label class="form-label">Job Title</label>
	                    <input type="text" class="form-control" name="title" placeholder="Ex. Sales Manager" required>
	                </div>
	            </div>
	            
	            <div class="row g-3 mt-2">
	                <div class="">
	                    <label class="form-label">Job Description</label>
	                    <textarea class="form-control" name="description" placeholder="Description of the job"></textarea>
	                </div>
	            </div>

	            <div class="row g-3 mt-2">
	                <div class="col-md-6">
	                    <label class="form-label">Location</label>
	                    <input type="text" class="form-control" name="location" placeholder="City" required>
	                </div>
	                <div class="col-md-3">
	                    <label class="form-label">Remote?</label>
	                    <select name="isRemote" class="form-select">
	                    	<option value="1">Remote</option>
	                    	<option value="0">Not Remote</option>
	                    </select>
	                </div>
	            </div>
	
	            <div class="row g-3 mt-2">
	                <div class="col-md-6">
	                    <label class="form-label">Salary (₹)</label>
	                    <input type="number" class="form-control" name="salary" placeholder="Salary / Stipend">
	                </div>
	            </div>
	
	            <div class="mt-4 text-center">
	                <button type="submit" class="btn btn-primary px-5 py-2 rounded-pill">Publish Job</button>
	            </div>
	        </form>
	    </div>
	</div>
</section>

<!-- Footer -->
<div class="footer">
    <div class="container">
        <a href="terms.jsp" class="me-3">Terms & Conditions</a>
        <a href="privacy.jsp">Privacy Policy</a>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>