<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.example.model.Student" %>
<%@ page import="com.example.model.User" %>
<html>
<head>
    <title>Student List - Student Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            line-height: 1.6;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 1000px;
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
        .student-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            background-color: white;
            box-shadow: 0 0 5px rgba(0,0,0,0.05);
        }
        .student-table th, .student-table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .student-table th {
            background-color: #1976d2;
            color: white;
            font-weight: 500;
        }
        .student-table tr:hover {
            background-color: #f8f9fa;
        }
        .button {
            display: inline-block;
            padding: 8px 16px;
            color: white;
            text-decoration: none;
            border-radius: 4px;
            transition: background-color 0.3s;
            border: none;
            cursor: pointer;
            font-size: 14px;
        }
        .add-button {
            background-color: #4caf50;
            margin: 20px 0;
        }
        .add-button:hover {
            background-color: #45a049;
        }
        .home-button {
            background-color: #1976d2;
            margin: 20px 10px;
        }
        .home-button:hover {
            background-color: #1565c0;
        }
        .edit-button {
            background-color: #ffa726;
        }
        .edit-button:hover {
            background-color: #fb8c00;
        }
        .delete-button {
            background-color: #ef5350;
        }
        .delete-button:hover {
            background-color: #e53935;
        }
        .logout-button {
            background-color: #757575;
            float: right;
        }
        .logout-button:hover {
            background-color: #616161;
        }
        .button-group {
            display: flex;
            gap: 8px;
        }
        .navigation {
            margin-bottom: 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .empty-message {
            text-align: center;
            padding: 20px;
            color: #666;
            font-style: italic;
        }
        .user-info {
            color: #666;
            font-size: 14px;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="user-info">
            <% User currentUser = (User) session.getAttribute("user"); %>
            Welcome, <%= currentUser.getUsername() %>!
        </div>
        
        <h1>Student List</h1>
        
        <div class="navigation">
            <div>
                <a href="${pageContext.request.contextPath}/add-student" class="button add-button">Add New Student</a>
                <a href="${pageContext.request.contextPath}/" class="button home-button">Back to Home</a>
            </div>
            <a href="${pageContext.request.contextPath}/logout" class="button logout-button">Logout</a>
        </div>

        <table class="student-table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Course</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <% 
                List<Student> students = (List<Student>) request.getAttribute("students");
                if (students != null && !students.isEmpty()) {
                    for (Student student : students) {
                %>
                    <tr>
                        <td><%= student.getId() %></td>
                        <td><%= student.getName() %></td>
                        <td><%= student.getEmail() %></td>
                        <td><%= student.getCourse() %></td>
                        <td class="button-group">
                            <a href="${pageContext.request.contextPath}/edit-student?id=<%= student.getId() %>" 
                               class="button edit-button">Edit</a>
                            <form action="${pageContext.request.contextPath}/delete-student" method="post" 
                                  style="display: inline;">
                                <input type="hidden" name="id" value="<%= student.getId() %>">
                                <button type="submit" class="button delete-button" 
                                        onclick="return confirm('Are you sure you want to delete this student?')">
                                    Delete
                                </button>
                            </form>
                        </td>
                    </tr>
                <%
                    }
                } else {
                %>
                    <tr>
                        <td colspan="5" class="empty-message">No students found</td>
                    </tr>
                <%
                }
                %>
            </tbody>
        </table>
    </div>
</body>
</html> 