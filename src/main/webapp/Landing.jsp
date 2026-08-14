<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<jsp:include page="LandingNav.jsp"></jsp:include>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Landing Page</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <style>
        body {
            background-color: #f9f9f9;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            color:#333;
        }

        .hero {
            text-align: center;
            padding: 100px 20px;
            background: linear-gradient(135deg, #e8f5e9, #e3f2fd);
            border-bottom-left-radius: 50% 10%;
            border-bottom-right-radius: 50% 10%;
        }
        .hero h1 {
            font-size: 3rem;
            font-weight: 800;
        }
        .hero h1 span {
            color: #28a745;
        }
        .hero p {
            font-size: 1.2rem;
            margin: 20px 0;
            color: #555;
        }
        .btn-custom {
            padding: 12px 36px;
            font-size: 1.1rem;
            border-radius: 50px;
            font-weight: 600;
            transition: 0.3s ease;
        }
        .btn-custom:hover {
            transform: translateY(-3px);
            box-shadow: 0 6px 18px rgba(0,0,0,0.15);
        }

        /* Steps Section */
        .step-box {
            border-radius: 20px;
            padding: 35px 20px;
            text-align: center;
            background-color: #fff;
            transition: all 0.3s ease-in-out;
            box-shadow: 0 4px 12px rgba(0,0,0,0.06);
        }
        .step-box:hover {
            transform: translateY(-6px);
            box-shadow: 0 8px 20px rgba(0,0,0,0.12);
        }
        .step-box i {
            padding: 20px;
            border-radius: 50%;
            background: #f1f1f1;
            font-size: 2.5rem;
        }
        .step-box h5 {
            margin-top: 20px;
            font-weight: 600;
        }

        
        .cta-section {
            background: linear-gradient(135deg, #1a1a2e, #2c3e50);
            color: white;
            padding: 80px 20px;
            text-align: center;
        }
        .cta-section h2 {
            font-size: 2.5rem;
            font-weight: 700;
        }
        .cta-section p {
            margin-top: 15px;
            font-size: 1.1rem;
            opacity: 0.85;
        }

        .footer {
            padding: 35px 20px;
            background-color: #fff;
            border-top: 1px solid #eee;
            font-size: 0.95rem;
        }
        .footer a {
            color: #555;
            text-decoration: none;
            transition: color 0.2s ease;
        }
        .footer a:hover {
            color: #28a745;
        }
    </style>
</head>
<body>

<section class="hero d-flex flex-column justify-content-center align-items-center text-center">
    <h1>WHERE YOUR CAREER TAKES <span>FLIGHT</span></h1>
    <p>Your hunt begins here.</p>
    <div class="d-flex flex-column flex-md-row gap-3 justify-content-center mt-3">
        <a href="JobListServlet?dest=seeker" class="btn btn-success btn-lg btn-custom">Explore Jobs</a>
        <a href="RecruiterLogin.jsp" class="btn btn-outline-dark btn-lg btn-custom">Get Top Applicants</a>
    </div>
</section>

<section class="container py-5 text-center">
    <h3 class="fw-bold mb-5">Get Hired in 4 <span class="text-success">Quick</span> and <span class="text-success">Easy</span> Steps</h3>
    <div class="row g-4">
        <div class="col-sm-6 col-lg-3">
            <div class="step-box">
                <i class="bi bi-person-circle text-success"></i>
                <h5>Create an Account</h5>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="step-box">
                <i class="bi bi-search text-info"></i>
                <h5>Search for Jobs</h5>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="step-box">
                <i class="bi bi-file-earmark-text text-danger"></i>
                <h5>Fill Details & Apply</h5>
            </div>
        </div>
        <div class="col-sm-6 col-lg-3">
            <div class="step-box">
                <i class="bi bi-briefcase text-warning"></i>
                <h5>Get the Job</h5>
            </div>
        </div>
    </div>
</section>


<section class="cta-section">
    <h2 class="fw-bold">Ready for your next job?</h2>
    <a href="JobListServlet?dest=seeker" class="btn btn-success btn-lg btn-custom mt-4">Explore Jobs</a>
    <p class="mt-3">Looking to hire? <a href="RecruiterLogin.jsp" class="text-light text-decoration-underline">Find top applicants here</a></p>
</section>

<!-- Footer -->
<footer class="footer">
    <div class="container">
        <div class="row align-items-center">
            <div class="col-md-6 text-center text-md-start mb-2 mb-md-0">
                <a href="JobListServlet?dest=seeker" class="me-3">Explore Jobs</a>
                <a href="RecruiterLogin.jsp" class="me-3">Hire Applicants</a>
                <a href="AdminLogin.jsp">Admin Login</a>
            </div>
            <div class="col-md-6 text-center text-md-end">
                <a href="#" class="me-3">Terms & Conditions</a>
                <a href="#">Privacy Policy</a>
            </div>
        </div>
    </div>
</footer>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

<script>
    // Optional: Smooth scroll for anchors
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function (e) {
            e.preventDefault();
            document.querySelector(this.getAttribute('href')).scrollIntoView({ behavior: 'smooth' });
        });
    });
</script>
</body>
</html>