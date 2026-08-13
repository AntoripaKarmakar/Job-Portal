<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Carrier Nest Navigation bar</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

<style>
    /* Navbar Styling */
    .navbar {
        padding: 1rem 2rem;
        background: linear-gradient(90deg, #0c243b, #132d4d);
        box-shadow: 0 3px 10px rgba(0,0,0,0.15);
    }

    /* Brand / Logo */
    .navbar-brand {
        font-size: 1.7rem;
        font-weight: 700;
        color: #fff !important;
        letter-spacing: 1px;
        display: flex;
        align-items: center;
        transition: all 0.3s ease;
    }
    .navbar-brand:hover {
        color: #28a745 !important;
        transform: scale(1.05);
    }
    .navbar-brand svg {
        stroke: #28a745;
        margin-right: 10px;
        transition: stroke 0.3s ease, transform 0.3s ease;
    }
    .navbar-brand:hover svg {
        transform: rotate(-5deg) scale(1.05);
    }

    .navbar-nav .nav-link {
        color: #f5f5f5 !important;
        margin: 0 12px;
        font-weight: 500;
        font-size: 1rem;
        transition: color 0.3s ease, transform 0.2s ease;
    }
    .navbar-nav .nav-link:hover {
        color: #28a745 !important;
        transform: translateY(-2px);
    }

    /* Admin Button */
    .btn-admin {
        background: #ffffff; /* white background */
        border: 1px solid #28a745; /* green border for visibility */
        color: #28a745; /* green text */
        font-weight: 600;
        padding: 7px 20px;
        border-radius: 30px;
        transition: all 0.3s ease;
        box-shadow: 0 2px 6px rgba(0,0,0,0.2);
    }
    .btn-admin:hover {
        background: #28a745; /* green background on hover */
        color: #ffffff; /* white text on hover */
        transform: translateY(-2px) scale(1.03);
        box-shadow: 0 4px 10px rgba(0,0,0,0.25);
    }

</style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg fixed-top">
    <div class="container">
        <!-- Logo -->
        <a class="navbar-brand" href="#">
            <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64" width="32" height="32" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                <ellipse cx="32" cy="40" rx="20" ry="10"></ellipse>
                <path d="M12 40c4 4 12 8 20 8s16-4 20-8"></path>
                <path d="M14 36c4 4 10 6 18 6s14-2 18-6"></path>
                <line x1="32" y1="40" x2="32" y2="24"></line>
                <path d="M32 24c-4-6-12-6-14 0 2 4 8 6 14 0z"></path>
                <path d="M32 24c4-6 12-6 14 0-2 4-8 6-14 0z"></path>
            </svg>
            CarrierNest
        </a>

        <!-- Mobile Menu -->
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <i class="bi bi-list" style="color:white; font-size:1.5rem;"></i>
        </button>

        <!-- Nav Links -->
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto align-items-lg-center">
                <li class="nav-item"><a href="SeekerLogin.jsp" class="nav-link">Find Jobs</a></li>
                <li class="nav-item"><a href="RecruiterLogin.jsp" class="nav-link">Hire Applicants</a></li>
                <li class="nav-item"><a href="AdminLogin.jsp" class="nav-link">Admin</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>