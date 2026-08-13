<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%>
    <jsp:include page="PosterNav.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarrierNest - Recruiter Signup</title>
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
        justify-content: center;
        position: relative;
    }

    /* Soft background pattern */
    body::before {
        content: "";
        position: absolute;
        top: 0; left: 0; 
        width: 100%; height: 100%;
        background: url('https://www.transparenttextures.com/patterns/cubes.png');
        opacity: 0.07;
    }

    /* Signup container */
    .signup-container {
        background: rgba(255,255,255,0.95);
        border-radius: 20px;
        box-shadow: 0 20px 40px rgba(0,0,0,0.15);
        overflow: hidden;
        display: flex;
        backdrop-filter: blur(12px);
        animation: fadeInUp 0.9s ease;
    }

    .form-section {
        padding: 50px;
    }
    .form-control {
        border-radius: 12px;
        padding: 12px;
        border: 1px solid #e0e0e0;
        transition: 0.3s;
    }
    .form-control:focus {
        border-color: #0c243b;
        box-shadow: 0 0 8px rgba(12,36,59,0.3);
    }
    .btn-signup {
        border-radius: 12px;
        padding: 14px;
        font-weight: 600;
        transition: all 0.3s ease;
    }
    .btn-signup:hover {
        background: #0a1d2e;
        transform: translateY(-2px);
    }

    /* Brand section */
    .brand-section {
        background: linear-gradient(160deg, #0c243b, #123456);
        color: #fff;
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: center;
        padding: 50px;
        animation: slideInLeft 1s ease;
        text-align: center;
    }
    .brand-section h2 {
        font-weight: bold;
        letter-spacing: 1px;
    }
    .brand-section p {
        color: #cfd8dc;
        max-width: 280px;
    }
    svg {
        animation: pulse 2s infinite;
    }

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
        50% { transform: scale(1.05); }
        100% { transform: scale(1); }
    }

    /* Responsive */
    @media (max-width: 992px) {
        .brand-section {
            display: none; 
        }
    }
</style>
</head>
<body>
<!-- Signup Form -->
<div class="container mt-5 pt-5">
    <div class="row justify-content-center">
        <div class="col-lg-10">
            <div class="row signup-container">
                
                <!-- Left: Branding -->
                <div class="col-lg-5 brand-section">
                    <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 64 64" width="90" height="90" fill="none" stroke="white" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="mb-3">
                        <ellipse cx="32" cy="40" rx="20" ry="10"></ellipse>
                        <path d="M12 40c4 4 12 8 20 8s16-4 20-8"></path>
                        <path d="M14 36c4 4 10 6 18 6s14-2 18-6"></path>
                        <line x1="32" y1="40" x2="32" y2="24"></line>
                        <path d="M32 24c-4-6-12-6-14 0 2 4 8 6 14 0z"></path>
                        <path d="M32 24c4-6 12-6 14 0-2 4-8 6-14 0z"></path>
                    </svg>
                    <h2>CarrierNest</h2>
                    <p>Find the best talent for your company with ease. Join CarrierNest today!</p>
                </div>

                <!-- Right: Signup Form -->
                <div class="col-lg-7 form-section">
                    <h3 class="fw-bold mb-4">Create Recruiter Account</h3>
                    <form action="SignupServlet?role=recruiter" method="POST">
	                    <div class="mb-3">
	                        <label class="form-label">Full Name</label>
	                        <input name="name" type="text" class="form-control" placeholder="Enter your name">
	                    </div>
	                    <div class="mb-3">
                            <label class="form-label">Email Address</label>
                            <input name="email" type="email" class="form-control" placeholder="Enter your email">
                        </div>
                        <div class="mb-3">
                            <label class="form-label">Password</label>
                            <input name="password" type="password" class="form-control" placeholder="Enter password">
                        </div>
                        <button type="submit" class="btn btn-success w-100 btn-signup">Sign Up</button>
                        <div class="text-center mt-3">
                            <small class="text-muted">Already have an account? <a href="AdminLogin.jsp" class="text-primary">Login</a></small>
                        </div>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>

</body>
</html>