<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.example.model.Student" %>
<html>
<head>
    <title>Edit Student - Student Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            line-height: 1.6;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background-color: white;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 8px;
        }
        h1 {
            color: #1976d2;
            text-align: center;
            margin-bottom: 30px;
        }
        .form-group {
            margin-bottom: 20px;
        }
        label {
            display: block;
            margin-bottom: 5px;
            color: #333;
            font-weight: 500;
        }
        input[type="text"],
        input[type="email"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
        }
        input[type="text"]:focus,
        input[type="email"]:focus {
            border-color: #1976d2;
            outline: none;
            box-shadow: 0 0 5px rgba(25,118,210,0.2);
        }
        .button {
            display: inline-block;
            padding: 10px 20px;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }
        .submit-button {
            background-color: #4caf50;
        }
        .submit-button:hover {
            background-color: #45a049;
        }
        .cancel-button {
            background-color: #f44336;
            margin-left: 10px;
        }
        .cancel-button:hover {
            background-color: #da190b;
        }
        .button-group {
            margin-top: 30px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Edit Student</h1>
        
        <% Student student = (Student) request.getAttribute("student"); %>
        
        <form action="${pageContext.request.contextPath}/edit-student" method="post">
            <input type="hidden" name="id" value="<%= student.getId() %>">
            
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" value="<%= student.getName() %>" required>
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" value="<%= student.getEmail() %>" required>
            </div>
            
            <div class="form-group">
                <label for="course">Course:</label>
                <input type="text" id="course" name="course" value="<%= student.getCourse() %>" required>
            </div>
            
            <div class="button-group">
                <button type="submit" class="button submit-button">Update Student</button>
                <a href="${pageContext.request.contextPath}/students" class="button cancel-button">Cancel</a>
            </div>
        </form>
    </div>
</body>
</html> 