<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login - Student Management System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            line-height: 1.6;
            background-color: #f5f5f5;
        }
        .container {
            max-width: 400px;
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
        .register-link {
            text-align: center;
            margin-top: 20px;
        }
        .register-link a {
            color: #1976d2;
            text-decoration: none;
        }
        .register-link a:hover {
            text-decoration: underline;
        }
        .error-message {
            color: #f44336;
            font-size: 14px;
            margin: 10px 0;
            text-align: center;
            padding: 10px;
            background-color: #ffebee;
            border-radius: 4px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Login</h1>
        
        <% if (request.getAttribute("error") != null) { %>
            <div class="error-message">
                <%= request.getAttribute("error") %>
            </div>
        <% } %>
        
        <form action="${pageContext.request.contextPath}/login" method="post" id="loginForm">
            <div class="form-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required 
                       placeholder="Enter your username">
            </div>
            
            <div class="form-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required
                       placeholder="Enter your password">
            </div>
            
            <button type="submit" class="button submit-button">Login</button>
        </form>
        
        <div class="register-link">
            Don't have an account? <a href="${pageContext.request.contextPath}/register">Register here</a>
        </div>
    </div>

    <script>
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            const username = document.getElementById('username');
            const password = document.getElementById('password');

            // Remove any existing error messages
            document.querySelectorAll('.error-message').forEach(el => el.remove());

            let isValid = true;

            if (username.value.trim() === '') {
                isValid = false;
                const error = document.createElement('div');
                error.className = 'error-message';
                error.textContent = 'Please enter your username';
                username.parentNode.appendChild(error);
            }

            if (password.value === '') {
                isValid = false;
                const error = document.createElement('div');
                error.className = 'error-message';
                error.textContent = 'Please enter your password';
                password.parentNode.appendChild(error);
            }

            if (!isValid) {
                e.preventDefault();
            }
        });
    </script>
</body>
</html> 