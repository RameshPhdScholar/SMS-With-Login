<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<html>
<head>
    <title>Error - Student Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            text-align: center;
        }
        .error-container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        h1 {
            color: #d32f2f;
        }
        .back-link {
            margin-top: 20px;
            display: inline-block;
            padding: 10px 20px;
            background-color: #1976d2;
            color: white;
            text-decoration: none;
            border-radius: 4px;
        }
        .back-link:hover {
            background-color: #1565c0;
        }
    </style>
</head>
<body>
    <div class="error-container">
        <h1>Page Not Found</h1>
        <p>Sorry, the page you are looking for could not be found.</p>
        <p>Please check the URL for any typos or try navigating from the home page.</p>
        <a href="${pageContext.request.contextPath}/" class="back-link">Go to Home Page</a>
    </div>
</body>
</html> 