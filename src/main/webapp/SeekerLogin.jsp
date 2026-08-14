<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
	<jsp:include page="SeekerNav.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarrierNest - Seeker SignUp</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background: linear-gradient(135deg, #f0fff4, #e6f7ff);
        min-height: 100vh;
        display: flex;
        align-items: center;
    }
    
    /* Navbar Styling */
    .navbar {
        padding: 0.8rem 1.5rem;
        background-color: #0c243b;
        transition: background-color 0.3s ease-in-out;
    }

    /* Logo & Brand */
    .navbar-brand {
        font-size: 1.4rem;
        color: #f1f1f1;
        text-decoration: none;
        display: flex;
        align-items: center;
        transition: color 0.3s ease, transform 0.3s ease;
    }

    .navbar-brand:hover {
        color: #ffffff;
        text-shadow: 0px 0px 8px #ffffff;
        transform: scale(1.05);
    }

    .navbar-brand svg {
        stroke: #fff;
        transition: transform 0.4s ease, stroke 0.4s ease;
    }

    .navbar-brand:hover svg {
        stroke: #00d1b2;
        transform: rotate(-8deg) scale(1.1);
    }

    /* Nav links */
    .nav-link {
        font-size: 0.95rem;
        color: #e0e0e0 !important;
        margin: 0 6px;
        position: relative;
        transition: color 0.3s ease;
    }

    .nav-link:hover {
        color: #00d1b2 !important;
    }

    /* Underline hover effect */
    .nav-link::after {
        content: "";
        display: block;
        width: 0;
        height: 2px;
        background: #00d1b2;
        transition: width 0.3s;
        margin: auto;
    }

    .nav-link:hover::after {
        width: 100%;
    }

    /* Signup Button */
    .btn-signup {
        border-radius: 50px;
        font-size: 0.9rem;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
    }

    .btn-signup:hover {
        transform: translateY(-2px);
        box-shadow: 0 4px 12px rgba(0, 209, 178, 0.4);
    }
    
    .signup-container {
        background: #fff;
        border-radius: 20px;
        box-shadow: 0 12px 30px rgba(0,0,0,0.15);
        overflow: hidden;
        animation: fadeInUp 0.9s ease;
        margin-top: 100px; /* offset for fixed navbar */
    }
    .form-section {
        padding: 40px;
    }
    .form-control {
        border-radius: 10px;
        padding: 12px;
    }
    .btn-signup {
        border-radius: 10px;
        padding: 12px;
    }
    .brand-section {
        background: #0c243b;
        color: #fff;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 40px;
        animation: slideInLeft 1s ease;
    }
    .brand-section h2 {
        font-weight: bold;
    }
    .brand-section p {
        color: #dcdcdc;
        text-align: center;
    }
    svg {
        animation: pulse 2s infinite;
    }

    /* Animations */
    @keyframes fadeInUp {
        from { opacity: 0; transform: translateY(50px); }
        to { opacity: 1; transform: translateY(0); }
    }
    @keyframes slideInLeft {
        from { transform: translateX(-100%); opacity: 0; }
        to { transform: translateX(0); opacity: 1; }
    }
    @keyframes pulse {
        0% { transform: scale(1); }
        50% { transform: scale(1.1); }
        100% { transform: scale(1); }
    }

    @media (max-width: 992px) {
        .brand-section {
            display: none; /* Hide branding on small screens */
        }
    }

    html {
        scroll-behavior: smooth;
    }
</style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg shadow-sm fixed-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64" 
                 width="30" height="30" fill="none" stroke="white" 
                 stroke-width="2" stroke-linecap="round" stroke-linejoin="round" 
                 class="me-2">
                <ellipse cx="32" cy="40" rx="20" ry="10"></ellipse>
                <path d="M12 40c4 4 12 8 20 8s16-4 20-8"></path>
                <path d="M14 36c4 4 10 6 18 6s14-2 18-6"></path>
                <line x1="32" y1="40" x2="32" y2="24"></line>
                <path d="M32 24c-4-6-12-6-14 0 2 4 8 6 14 0z"></path>
                <path d="M32 24c4-6 12-6 14 0-2 4-8 6-14 0z"></path>
            </svg>
            CarrierNest
        </a>
        <button class="navbar-toggler text-light" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="bi bi-list"></span>
        </button>
        <div class="collapse navbar-collapse ms-auto" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-lg-center">
                <!-- Updated link with #jobForm -->
                <li class="nav-item"><a href="RecruiterLogin.jsp" class="nav-link fw-semibold">Post Jobs</a></li>
                <li class="nav-item"><a href="SeekerSignup.jsp#jobForm" class="btn btn-success btn-sm px-4 ms-2 btn-signup">Signup</a></li>
            </ul>
        </div>
    </div>
</nav>

<div class="container">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="row signup-container">
                
                <!-- Left: Branding -->
                <div class="col-lg-6 brand-section">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64" width="80" height="80" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="mb-3">
                        <ellipse cx="32" cy="40" rx="20" ry="10"></ellipse>
                        <path d="M12 40c4 4 12 8 20 8s16-4 20-8"></path>
                        <path d="M14 36c4 4 10 6 18 6s14-2 18-6"></path>
                        <line x1="32" y1="40" x2="32" y2="24"></line>
                        <path d="M32 24c-4-6-12-6-14 0 2 4 8 6 14 0z"></path>
                        <path d="M32 24c4-6 12-6 14 0-2 4-8 6-14 0z"></path>
                    </svg>
                    <h2>CarrierNest</h2>
                    <p>Join CarrierNest to apply new jobs</p>
                </div>

                <!-- Right: Signup Form with id -->
                <div class="col-lg-6 form-section" id="jobForm">
                    <h3 class="fw-bold mb-4">Seeker Login</h3>
                    <form action="LoginServlet" method="POST">
                        <div class="mb-3">
                            <label class="form-label">Email Address</label>
                            <input name="email" type="email" class="form-control" placeholder="Enter your email">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input name="password" type="password" class="form-control" placeholder="Enter your password">
                        </div>
                        <button type="submit" class="btn btn-success w-100 btn-signup">Login</button>
                        <div class="text-center mt-3">
                            <small class="text-muted">Don't have an account? 
                                <a href="SeekerSignup.jsp" class="text-primary">SignUp</a>
                            </small>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>

</body>
</html>