<%@page import="master.dto.UserDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarrierNest Navbar</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f9f9f9;
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
        color: #f1f1f1 !impportant;
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
</style>
</head>
<body>
<!-- Navbar -->
<nav class="navbar navbar-expand-lg shadow-sm fixed-top">
    <div class="container">
        <a class="navbar-brand fw-bold" href="Landing.jsp" style="color: white">
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
                <li class="nav-item"><a href="RecruiterMain.jsp#post-job" class="nav-link fw-semibold">Post Jobs</a></li>
                <li class="nav-item"><a href="JobListServlet?dest=recruiter" class="nav-link fw-semibold">My Jobs</a></li>
                <li class="nav-item"><a href="LogoutServlet" class="btn btn-success btn-sm px-4 ms-2 btn-signup">Logout</a></li>
            </ul>
        </div>
    </div>
</nav>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
