<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <jsp:include page="RecruiterNav.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CarrierNest - Fresher Jobs</title>
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons/font/bootstrap-icons.css">

<style>
    body {
        font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        background-color: #f9f9f9;
        padding-top: 80px; 
    }
    
    .fresher-section {
        background: linear-gradient(135deg, #f0fff4, #e6f7ff);
        padding: 50px;
        border-radius: 20px;
        box-shadow: 0 10px 25px rgba(0,0,0,0.05);
        margin-top: 40px;
    }
    .job-card {
        transition: all 0.3s ease;
        border-radius: 15px;
        background: #fff;
        position: relative;
        overflow: hidden;
    }
    .job-card:hover {
        transform: translateY(-8px) scale(1.02);
        box-shadow: 0 12px 25px rgba(0,0,0,0.15);
    }
    .job-card::before {
        content: "";
        position: absolute;
        top: -50%;
        left: -50%;
        width: 200%;
        height: 200%;
        background: radial-gradient(circle at center, rgba(0, 123, 255, 0.08), transparent 70%);
        transform: scale(0);
        transition: transform 0.4s ease;
        border-radius: 50%;
        z-index: 0;
    }
    .job-card:hover::before {
        transform: scale(1);
    }
    .badge {
        font-size: 0.75rem;
        position: relative;
        z-index: 1;
    }
    .btn {
        transition: all 0.3s ease;
    }
    .btn:hover {
        transform: scale(1.05);
    }
    .card-body {
        position: relative;
        z-index: 1;
    }
</style>
</head>
<body>

<div class="container fresher-section">
    <div class="text-center mb-4">
        <h2 class="fw-bold">Connect with talent that drives your success</h2>
        <h4 class="text-muted">Fresher Jobs</h4>
    </div>

    <!-- JOB CARDS ROW -->
    <div class="row g-4">

        <!-- CARD TEMPLATE -->
        <div class="col-md-6 col-lg-3">
            <div class="card shadow-sm h-100 job-card">
                <div class="card-body d-flex flex-column">
                    <span class="badge bg-success mb-2">Actively hiring</span>
                    <h6 class="fw-bold">Embedded Systems Executive</h6>
                    <p class="text-muted small mb-1">Quantix Tech</p>
                    <p class="mb-1"><i class="bi bi-geo-alt"></i> Bangalore</p>
                    <p class="mb-3"><i class="bi bi-currency-rupee"></i> 2,00,000 / year</p>
                    <div class="mt-auto d-flex justify-content-between align-items-center">
                        <button class="btn btn-primary btn-sm px-4">Edit</button>
                        <a href="#" class="text-primary fw-semibold">View details <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>

        
        <!-- Junior Software Tester -->
        <div class="col-md-6 col-lg-3">
            <div class="card shadow-sm h-100 job-card">
                <div class="card-body d-flex flex-column">
                    <span class="badge bg-success mb-2">Actively hiring</span>
                    <h6 class="fw-bold">Junior Software Tester</h6>
                    <p class="text-muted small mb-1">Quantix Tech</p>
                    <p class="mb-1"><i class="bi bi-geo-alt"></i> Mumbai</p>
                    <p class="mb-3"><i class="bi bi-currency-rupee"></i> 2,60,000 - 3,50,000 / year</p>
                    <div class="mt-auto d-flex justify-content-between align-items-center">
                        <button class="btn btn-primary btn-sm px-4">Edit</button>
                        <a href="#" class="text-primary fw-semibold">View details <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Back-End Executive -->
        <div class="col-md-6 col-lg-3">
            <div class="card shadow-sm h-100 job-card">
                <div class="card-body d-flex flex-column">
                    <span class="badge bg-success mb-2">Actively hiring</span>
                    <h6 class="fw-bold">Back-End Executive - Fresher</h6>
                    <p class="text-muted small mb-1">Quantix Tech</p>
                    <p class="mb-1"><i class="bi bi-geo-alt"></i> Work From Home</p>
                    <p class="mb-3"><i class="bi bi-currency-rupee"></i> 3,60,000 - 8,50,000 / year</p>
                    <div class="mt-auto d-flex justify-content-between align-items-center">
                        <button class="btn btn-primary btn-sm px-4">Edit</button>
                        <a href="#" class="text-primary fw-semibold">View details <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- DevOps Engineer -->
        <div class="col-md-6 col-lg-3">
            <div class="card shadow-sm h-100 job-card">
                <div class="card-body d-flex flex-column">
                    <span class="badge bg-success mb-2">Actively hiring</span>
                    <h6 class="fw-bold">DevOps Engineer (AWS + Nginx)</h6>
                    <p class="text-muted small mb-1">Quantix Tech</p>
                    <p class="mb-1"><i class="bi bi-geo-alt"></i> Work From Home</p>
                    <p class="mb-3"><i class="bi bi-currency-rupee"></i> 3,00,000 - 4,50,000 / year</p>
                    <div class="mt-auto d-flex justify-content-between align-items-center">
                        <button class="btn btn-primary btn-sm px-4">Edit</button>
                        <a href="#" class="text-primary fw-semibold">View details <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- AI Engineer -->
        <div class="col-md-6 col-lg-3">
            <div class="card shadow-sm h-100 job-card">
                <div class="card-body d-flex flex-column">
                    <span class="badge bg-success mb-2">Actively hiring</span>
                    <h6 class="fw-bold">AI Engineer</h6>
                    <p class="text-muted small mb-1">Quantix Tech</p>
                    <p class="mb-1"><i class="bi bi-geo-alt"></i> Work From Home</p>
                    <p class="mb-3"><i class="bi bi-currency-rupee"></i> 4,00,000 - 5,50,000 / year</p>
                    <div class="mt-auto d-flex justify-content-between align-items-center">
                        <button class="btn btn-primary btn-sm px-4">Edit</button>
                        <a href="#" class="text-primary fw-semibold">View details <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- FullStack Developer -->
        <div class="col-md-6 col-lg-3">
            <div class="card shadow-sm h-100 job-card">
                <div class="card-body d-flex flex-column">
                    <span class="badge bg-success mb-2">Actively hiring</span>
                    <h6 class="fw-bold">FullStack Developer</h6>
                    <p class="text-muted small mb-1">Quantix Tech</p>
                    <p class="mb-1"><i class="bi bi-geo-alt"></i> Kolkata</p>
                    <p class="mb-3"><i class="bi bi-currency-rupee"></i> 4,00,000 - 6,50,000 / year</p>
                    <div class="mt-auto d-flex justify-content-between align-items-center">
                        <button class="btn btn-primary btn-sm px-4">Edit</button>
                        <a href="#" class="text-primary fw-semibold">View details <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- Cloud Architect -->
        <div class="col-md-6 col-lg-3">
            <div class="card shadow-sm h-100 job-card">
                <div class="card-body d-flex flex-column">
                    <span class="badge bg-success mb-2">Actively hiring</span>
                    <h6 class="fw-bold">Cloud Architect</h6>
                    <p class="text-muted small mb-1">Quantix Tech</p>
                    <p class="mb-1"><i class="bi bi-geo-alt"></i> Bangalore</p>
                    <p class="mb-3"><i class="bi bi-currency-rupee"></i> 4,00,000 - 6,50,000 / year</p>
                    <div class="mt-auto d-flex justify-content-between align-items-center">
                        <button class="btn btn-primary btn-sm px-4">Edit</button>
                        <a href="#" class="text-primary fw-semibold">View details <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <!-- CyberSecurity Analytics -->
        <div class="col-md-6 col-lg-3">
            <div class="card shadow-sm h-100 job-card">
                <div class="card-body d-flex flex-column">
                    <span class="badge bg-success mb-2">Actively hiring</span>
                    <h6 class="fw-bold">CyberSecurity Analytics</h6>
                    <p class="text-muted small mb-1">Quantix Tech</p>
                    <p class="mb-1"><i class="bi bi-geo-alt"></i> Pune</p>
                    <p class="mb-3"><i class="bi bi-currency-rupee"></i> 5,00,000 - 8,00,000 / year</p>
                    <div class="mt-auto d-flex justify-content-between align-items-center">
                        <button class="btn btn-primary btn-sm px-4">Edit</button>
                        <a href="#" class="text-primary fw-semibold">View details <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>

    </div>
</div><

</body>
</html>