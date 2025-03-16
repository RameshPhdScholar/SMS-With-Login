<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Register - Student Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            line-height: 1.6;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 500px;
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
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            font-size: 14px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }
        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
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
            width: 100%;
        }
        .submit-button {
            background-color: #1976d2;
        }
        .submit-button:hover {
            background-color: #1565c0;
        }
        .login-link {
            text-align: center;
            margin-top: 20px;
        }
        .login-link a {
            color: #1976d2;
            text-decoration: none;
        }
        .login-link a:hover {
            text-decoration: underline;
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
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Register</h1>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <form action="${pageContext.request.contextPath}/register" method="post" id="registerForm">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required 
                       placeholder="Choose a username"
                       pattern="[A-Za-z0-9_]{3,20}" 
                       title="Username must be 3-20 characters long and can only contain letters, numbers, and underscores">
            </div>
            
            <div class="form-group">
                <label for="email">Email:</label>
                <input type="email" id="email" name="email" required
                       placeholder="Enter your email address">
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required
                       placeholder="Choose a password"
                       pattern="^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$"
                       title="Password must be at least 8 characters long and include both letters and numbers">
            </div>
            
            <div class="form-group">
                <label for="confirmPassword">Confirm Password:</label>
                <input type="password" id="confirmPassword" name="confirmPassword" required
                       placeholder="Confirm your password">
            </div>
            
            <button type="submit" class="button submit-button">Register</button>
        </form>
        
        <div class="login-link">
            Already have an account? <a href="${pageContext.request.contextPath}/login">Login here</a>
        </div>
    </div>

    <script>
        document.getElementById('registerForm').addEventListener('submit', function(e) {
            const username = document.getElementById('username');
            const email = document.getElementById('email');
            const password = document.getElementById('password');
            const confirmPassword = document.getElementById('confirmPassword');

            // Remove any existing error messages
            document.querySelectorAll('.error-message').forEach(el => el.remove());

            let isValid = true;

            // Validate username
            if (!/^[A-Za-z0-9_]{3,20}$/.test(username.value.trim())) {
                isValid = false;
                const error = document.createElement('div');
                error.className = 'error-message';
                error.textContent = 'Username must be 3-20 characters long and can only contain letters, numbers, and underscores';
                username.parentNode.appendChild(error);
            }

            // Validate email
            if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email.value.trim())) {
                isValid = false;
                const error = document.createElement('div');
                error.className = 'error-message';
                error.textContent = 'Please enter a valid email address';
                email.parentNode.appendChild(error);
            }

            // Validate password
            if (!/^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/.test(password.value)) {
                isValid = false;
                const error = document.createElement('div');
                error.className = 'error-message';
                error.textContent = 'Password must be at least 8 characters long and include both letters and numbers';
                password.parentNode.appendChild(error);
            }

            // Validate password confirmation
            if (password.value !== confirmPassword.value) {
                isValid = false;
                const error = document.createElement('div');
                error.className = 'error-message';
                error.textContent = 'Passwords do not match';
                confirmPassword.parentNode.appendChild(error);
            }

            if (!isValid) {
                e.preventDefault();
            }
        });
    </script>
</body>
</html> 