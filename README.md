# 💼 Job Portal

A full-stack web-based **Job Portal application** built with **Java Servlets, JSP, JDBC, and MySQL**. The platform connects job seekers with recruiters and provides an administrative workflow for reviewing and verifying job postings.

The application implements **role-based functionality** for Job Seekers, Recruiters, and Administrators, with dedicated workflows for authentication, job management, and job applications.

---

## 📌 Overview

The Job Portal provides three primary user roles:

* 👤 **Job Seeker** — Browse jobs and submit applications.
* 🏢 **Recruiter** — Create and manage job postings and review applications.
* 🛡️ **Administrator** — Review and verify job postings before they become available as verified listings.

The application follows a layered architecture using **Servlets for request handling, JSP for the presentation layer, DAO classes for database operations, and DTO classes for transferring data between layers**.

---

## ✨ Key Features

### 👤 Job Seeker

* Create a Job Seeker account
* Secure login with hashed passwords
* Browse available job postings
* View detailed job information
* Submit job applications
* Provide education/work details
* Provide years of experience
* Add a cover letter
* View submitted applications
* Delete submitted applications
* Logout

### 🏢 Recruiter

* Create a Recruiter account
* Recruiter authentication
* Create new job postings
* Add:

  * Job title
  * Job description
  * Company
  * Salary
  * Location
  * Remote-work availability
* View recruiter-specific job postings
* View detailed job information
* Delete job postings
* View applications submitted for jobs
* Logout

### 🛡️ Administrator

* Dedicated administrator login
* View job postings
* Review job details
* Verify job postings
* View verified jobs
* Manage the job verification workflow

---

## 🏗️ Architecture

The application follows a layered MVC-inspired architecture:

```text
                    ┌─────────────────────┐
                    │       Browser       │
                    │     HTML / JSP      │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │      Servlets       │
                    │  Request Handling   │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │       DTOs          │
                    │  Data Representation│
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │       DAOs          │
                    │ Database Operations  │
                    └──────────┬──────────┘
                               │
                               ▼
                    ┌─────────────────────┐
                    │       MySQL         │
                    │      Database       │
                    └─────────────────────┘
```

### Request Flow

```text
User
  ↓
JSP / Form
  ↓
Servlet
  ↓
DTO
  ↓
DAO
  ↓
JDBC
  ↓
MySQL
  ↓
DAO
  ↓
Servlet
  ↓
JSP Response
```

---

## 🛠️ Technology Stack

| Category              | Technology                |
| --------------------- | ------------------------- |
| Language              | Java                      |
| Backend               | Java Servlets             |
| View Layer            | JSP                       |
| Database              | MySQL                     |
| Database Connectivity | JDBC                      |
| Web Server            | Apache Tomcat             |
| Architecture          | Servlet + JSP + DAO + DTO |
| Authentication        | HTTP Session              |
| Password Security     | SHA-256                   |
| Database Driver       | MySQL Connector/J 8.0.33  |
| IDE                   | Eclipse                   |
| Web Configuration     | Servlet 4.0               |

---

## 📂 Project Structure

```text
JobPortal/
│
├── src/
│   └── main/
│       ├── java/
│       │   └── master/
│       │       │
│       │       ├── dao/
│       │       │   ├── UserDao.java
│       │       │   ├── JobDao.java
│       │       │   └── ApplDao.java
│       │       │
│       │       ├── dto/
│       │       │   ├── UserDto.java
│       │       │   ├── JobDto.java
│       │       │   └── ApplDto.java
│       │       │
│       │       ├── servlet/
│       │       │   ├── LoginServlet.java
│       │       │   ├── LogoutServlet.java
│       │       │   ├── SignupServlet.java
│       │       │   ├── JobAddServe.java
│       │       │   ├── JobDeleteServe.java
│       │       │   ├── JobDetailsServe.java
│       │       │   ├── JobListServlet.java
│       │       │   ├── JobUpdateServe.java
│       │       │   ├── ApplyServlet.java
│       │       │   ├── NewApplicationServe.java
│       │       │   ├── MyApplicationServlet.java
│       │       │   ├── ApplicationListServlet.java
│       │       │   └── DeleteApplicationServlet.java
│       │       │
│       │       └── utilities/
│       │           ├── ConnectionFactory.java
│       │           └── PasswordUtil.java
│       │
│       └── webapp/
│           ├── Landing.jsp
│           ├── SeekerLogin.jsp
│           ├── SeekerSignup.jsp
│           ├── RecruiterLogin.jsp
│           ├── RecruiterSignup.jsp
│           ├── AdminLogin.jsp
│           ├── ViewJob.jsp
│           ├── ViewJobRecruiter.jsp
│           ├── ViewJobAdmin.jsp
│           ├── JobDetailsSeeker.jsp
│           ├── JobDetailsRecruiter.jsp
│           ├── ApplyForm.jsp
│           ├── ViewApplications.jsp
│           ├── ViewApplications.jsp
│           ├── RecruiterMain.jsp
│           ├── AdminLanding.jsp
│           ├── AdminNav.jsp
│           ├── RecruiterNav.jsp
│           ├── SeekerNav.jsp
│           ├── LandingNav.jsp
│           ├── error.jsp
│           │
│           └── WEB-INF/
│               ├── web.xml
│               └── lib/
│                   └── mysql-connector-j-8.0.33.jar
│
└── README.md
```

---

## 🔐 Authentication & Authorization

The application supports authentication for different user roles.

### User Registration

During registration, users provide:

```text
Name
Email
Password
Role
```

Supported roles include:

```text
seeker
recruiter
```

User credentials are processed through `PasswordUtil` before being stored.

### Password Hashing

The project uses **SHA-256 hashing** through Java's `MessageDigest` API.

```text
Plain Password
      ↓
SHA-256
      ↓
Base64 Encoded Hash
      ↓
Database
```

### Session Management

After successful authentication, the application stores the authenticated user and role in the HTTP session.

This allows the application to determine which functionality should be available to the current user.

---

## 💼 Job Management Workflow

Recruiters can create job postings containing:

```text
Job Title
Description
Company
Salary
Location
Remote Availability
Recruiter/User ID
```

The job is stored in the MySQL database through `JobDao`.

### Job Verification

New jobs can be reviewed by the administrator.

```text
Recruiter
    │
    ▼
Create Job
    │
    ▼
Job stored in database
    │
    ▼
Administrator reviews job
    │
    ▼
Job verification
    │
    ▼
Verified Job
```

The application maintains an `is_verified` status for job postings.

---

## 📄 Job Application Workflow

A Job Seeker can apply for a job by submitting:

* Education / work details
* Years of experience
* Cover letter

The application is stored through `ApplDao`.

### Application Flow

```text
Job Seeker
    │
    ▼
Browse Jobs
    │
    ▼
View Job Details
    │
    ▼
Apply
    │
    ▼
Application Form
    │
    ▼
Submit Application
    │
    ▼
My Applications
```

Recruiters can also retrieve applications associated with their job postings.

---

## 🗄️ Database

The application uses **MySQL** with the database:

```text
jobportal
```

The application interacts with database entities representing:

```text
USERS
JOBS
APPLICATIONS
```

### Users

Stores information related to:

* User ID
* Name
* Email
* Password
* Role

### Jobs

Stores information related to:

* Job ID
* Title
* Description
* Company
* Salary
* Location
* Remote status
* Recruiter/User ID
* Verification status
* Posting timestamp

### Applications

Stores information related to:

* Application ID
* Job ID
* User ID
* Education/work details
* Experience
* Cover letter
* Application timestamp

---

## ⚙️ Setup & Installation

### Prerequisites

Make sure the following are installed:

* Java JDK
* Eclipse IDE
* Apache Tomcat
* MySQL Server
* MySQL Workbench (recommended)
* MySQL Connector/J 8.0.33

---

### 1. Clone the Repository

```bash
git clone https://github.com/AntoripaKarmakar/Job-Portal.git
```

Or download the repository as a ZIP file from GitHub.

---

### 2. Import the Project into Eclipse

Open Eclipse and import the project as an existing Java/Web project.

Make sure the project is configured with the appropriate Apache Tomcat runtime.

---

### 3. Create the MySQL Database

Create the database:

```sql
CREATE DATABASE jobportal;
```

Create the required tables according to the application's DAO queries and DTO fields.

The core tables are:

```text
USERS
JOBS
APPLICATIONS
```

---

### 4. Configure Database Connection

The application uses JDBC to connect to MySQL.

The connection follows this format:

```text
jdbc:mysql://localhost:3306/jobportal
```

Update the database username and password according to your local MySQL configuration.

> **Security note:** Never commit real database passwords or credentials to a public GitHub repository. Store sensitive configuration outside the source code.

---

### 5. Configure Apache Tomcat

Add Apache Tomcat to Eclipse:

```text
Eclipse
   ↓
Servers
   ↓
New Server
   ↓
Apache Tomcat
```

Select the appropriate Tomcat version and associate it with the project.

---

### 6. Run the Application

Right-click the project:

```text
Run As
   ↓
Run on Server
```

The application will start on your local Tomcat server.

The default landing page is:

```text
Landing.jsp
```

---

## 🔑 Application Roles

| Role          | Main Capabilities                                     |
| ------------- | ----------------------------------------------------- |
| 👤 Job Seeker | Browse jobs, view details, apply, manage applications |
| 🏢 Recruiter  | Create jobs, view/manage jobs, review applications    |
| 🛡️ Admin     | Review and verify job postings                        |

---

## 🧩 Design Patterns & Concepts Used

This project demonstrates several important Java web-development concepts:

* MVC-inspired web architecture
* Data Access Object (DAO)
* Data Transfer Object (DTO)
* Servlet request/response handling
* JSP-based presentation
* JDBC database connectivity
* Prepared Statements
* HTTP Session management
* Role-based application flow
* Password hashing
* CRUD database operations
* Request forwarding
* HTTP redirects

---

## 🔄 CRUD Operations

The application implements database operations for multiple entities.

### Users

```text
Create → User Registration
Read   → User Authentication / Retrieval
Delete → User Deletion
```

### Jobs

```text
Create → Recruiter creates a job
Read   → Users view jobs
Update → Admin verifies jobs
Delete → Recruiter deletes jobs
```

### Applications

```text
Create → Job Seeker applies
Read   → Seeker/Recruiter views applications
Delete → Seeker deletes an application
```

---



---

## 🚀 Future Enhancements

The project can be extended with:

* 🔎 Advanced job search and filtering
* 📍 Location-based job search
* 📄 Resume upload
* 📧 Email notifications
* 🔔 Application status notifications
* 👤 User profile management
* 🏢 Company profiles
* ⭐ Job bookmarking
* 📊 Recruiter analytics dashboard
* 📱 Improved responsive UI
* 🔐 Stronger authentication and authorization
* 🔑 Environment-based database configuration
* 🛡️ CSRF protection
* 🔒 Stronger password hashing using modern password-hashing algorithms
* ☁️ Cloud deployment

---

## ⚠️ Security Considerations

For production deployment, the following improvements are recommended:

* Move database credentials outside the source code.
* Use environment variables or secure configuration.
* Replace SHA-256 password hashing with a password-specific hashing algorithm such as BCrypt or Argon2.
* Implement stronger role-based authorization checks.
* Validate and sanitize user input.
* Add CSRF protection.
* Avoid exposing sensitive exception information.
* Use HTTPS in production.
* Configure secure session handling.

---

## 🎓 Learning Outcomes

This project demonstrates practical experience with:

```text
Java
   ↓
Servlets
   ↓
JSP
   ↓
JDBC
   ↓
DAO / DTO
   ↓
MySQL
   ↓
Tomcat
```

It provides hands-on implementation of **Java web application development, relational database integration, authentication, session management, CRUD operations, and role-based workflows**.

---

## 👩‍💻 Author

### Antoripa Karmakar

**GitHub:**
https://github.com/AntoripaKarmakar

---

## 📄 License

This project was developed for **educational, learning, and portfolio purposes**.
