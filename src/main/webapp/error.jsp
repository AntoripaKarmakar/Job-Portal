<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
<%@ page import="java.util.*" %>
<%
    // Get error parameter
    String errorCode = request.getParameter("error");
    String errorTitle = "Unexpected Error";
    String errorMessage = "Something went wrong. Please try again.";

    // Map common error codes to messages
    if (errorCode != null) {
        switch (errorCode) {
            case "invalidlogin":
                errorTitle = "Login Failed";
                errorMessage = "The email or password you entered is incorrect.";
                break;
            case "signupfailed":
                errorTitle = "Signup Failed";
                errorMessage = "We couldn’t create your account. Please try again.";
                break;
            case "invalidrole":
                errorTitle = "Unknown Role";
                errorMessage = "Your account role is not recognized.";
                break;
            case "unknownrole":
                errorTitle = "Access Error";
                errorMessage = "You are trying to log in with an unsupported role.";
                break;
            case "applicationdeletefailed":
            	errorTitle = "Application Delete Error";
                errorMessage = "Failed to withdraw your application. Please try again";
                break;
            default:
                errorTitle = "Oops!";
                errorMessage = "An unexpected error occurred.";
                break;
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CarrierNest - Error</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

    <style>
        body {
            background: linear-gradient(135deg, #fce4ec, #e3f2fd);
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .error-card {
            background: #fff;
            border-radius: 20px;
            padding: 40px;
            text-align: center;
            max-width: 500px;
            width: 90%;
            box-shadow: 0 8px 25px rgba(0,0,0,0.15);
            animation: fadeInUp 0.7s ease;
        }
        .error-icon {
            font-size: 4rem;
            color: #dc3545;
            margin-bottom: 15px;
        }
        h2 {
            font-weight: 700;
            color: #222;
        }
        p {
            color: #555;
            margin: 15px 0 25px;
        }
        .btn-custom {
            border-radius: 12px;
            padding: 12px 30px;
            font-weight: 600;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }
        .btn-custom:hover {
            transform: translateY(-2px);
            box-shadow: 0 6px 16px rgba(0,0,0,0.2);
        }
        @keyframes fadeInUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }
    </style>
</head>
<body>

<div class="error-card">
    <i class="bi bi-exclamation-triangle-fill error-icon"></i>
    <h2><%= errorTitle %></h2>
    <p><%= errorMessage %></p>
    <a href="Landing.jsp" class="btn btn-success btn-custom">Go to Home</a>
    <div class="mt-3">
        <small class="text-muted">Error Code: <%= errorCode != null ? errorCode : "unknown" %></small>
    </div>
</div>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
