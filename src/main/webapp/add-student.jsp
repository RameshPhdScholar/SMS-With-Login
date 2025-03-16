<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Student - Student Management System</title>
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
            transition: border-color 0.3s, box-shadow 0.3s;
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
        .error-message {
            color: #f44336;
            font-size: 14px;
            margin-top: 5px;
        }
        .success-message {
            color: #4caf50;
            text-align: center;
            padding: 10px;
            margin-bottom: 20px;
            background-color: #e8f5e9;
            border-radius: 4px;
            display: none;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Add New Student</h1>
        
        <form action="${pageContext.request.contextPath}/add-student" method="post" id="addStudentForm">
            <div class="form-group">
                <label for="name">Name:</label>
                <input type="text" id="name" name="name" required 
                       placeholder="Enter student's full name"
                       pattern="[A-Za-z\s]+" 
                       title="Please enter a valid name (letters and spaces only)">
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required
                       placeholder="Enter student's email address">
            </div>
            
            <div class="form-group">
                <label for="course">Course:</label>
                <input type="text" id="course" name="course" required
                       placeholder="Enter course name">
            </div>
            
            <div class="button-group">
                <button type="submit" class="button submit-button">Add Student</button>
                <a href="${pageContext.request.contextPath}/students" class="button cancel-button">Cancel</a>
            </div>
        </form>
    </div>

    <script>
        document.getElementById('addStudentForm').addEventListener('submit', function(e) {
            const nameInput = document.getElementById('name');
            const emailInput = document.getElementById('email');
            const courseInput = document.getElementById('course');

            // Remove any existing error messages
            document.querySelectorAll('.error-message').forEach(el => el.remove());

            let isValid = true;

            // Validate name
            if (!/^[A-Za-z\s]+$/.test(nameInput.value.trim())) {
                isValid = false;
                const error = document.createElement('div');
                error.className = 'error-message';
                error.textContent = 'Please enter a valid name (letters and spaces only)';
                nameInput.parentNode.appendChild(error);
            }

            // Validate email
            if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(emailInput.value.trim())) {
                isValid = false;
                const error = document.createElement('div');
                error.className = 'error-message';
                error.textContent = 'Please enter a valid email address';
                emailInput.parentNode.appendChild(error);
            }

            // Validate course
            if (courseInput.value.trim().length < 2) {
                isValid = false;
                const error = document.createElement('div');
                error.className = 'error-message';
                error.textContent = 'Course name must be at least 2 characters long';
                courseInput.parentNode.appendChild(error);
            }

            if (!isValid) {
                e.preventDefault();
            }
        });
    </script>
</body>
</html> 