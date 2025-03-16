<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Student Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            line-height: 1.6;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            color: #1976d2;
            text-align: center;
        }
        .nav-links {
            margin: 20px 0;
            padding: 20px;
            background-color: #f5f5f5;
            border-radius: 5px;
        }
        .nav-links a {
            display: inline-block;
            margin: 10px;
            padding: 10px 20px;
            background-color: #1976d2;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .nav-links a:hover {
            background-color: #1565c0;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Welcome to Student Management System</h1>
        
        <div class="nav-links">
            <h2>Available Pages:</h2>
            <a href="${pageContext.request.contextPath}/test">Test Servlet</a>
            <a href="${pageContext.request.contextPath}/students">View Students</a>
            <a href="${pageContext.request.contextPath}/add-student">Add Student</a>
        </div>

        <div class="content">
            <h2>About This System</h2>
            <p>This is a student management system that allows you to:</p>
            <ul>
                <li>View all students</li>
                <li>Add new students</li>
                <li>Update student information</li>
                <li>Delete students</li>
            </ul>
            <p>Click on any of the links above to get started!</p>
        </div>
    </div>
</body>
</html> 