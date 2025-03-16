package com.example.servlet;

import com.example.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to registration form
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form parameters
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        // Validate input
        if (username == null || email == null || password == null || confirmPassword == null ||
            username.trim().isEmpty() || email.trim().isEmpty() || 
            password.isEmpty() || confirmPassword.isEmpty()) {
            request.setAttribute("error", "All fields are required");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Validate username format
        if (!username.matches("[A-Za-z0-9_]{3,20}")) {
            request.setAttribute("error", "Username must be 3-20 characters long and can only contain letters, numbers, and underscores");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Validate email format
        if (!email.matches("^[A-Za-z0-9+_.-]+@(.+)$")) {
            request.setAttribute("error", "Please enter a valid email address");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Validate password
        if (!password.matches("^(?=.*[A-Za-z])(?=.*\\d)[A-Za-z\\d]{8,}$")) {
            request.setAttribute("error", "Password must be at least 8 characters long and include both letters and numbers");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            request.setAttribute("error", "Passwords do not match");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Get UserServlet instance
        UserServlet userServlet = (UserServlet) getServletContext().getAttribute("userServlet");
        
        // Check if username is available
        if (!userServlet.isUsernameAvailable(username)) {
            request.setAttribute("error", "Username is already taken");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Get the user list and generate new ID
        List<User> userList = userServlet.getUserList();
        int newId = userList.isEmpty() ? 1 : userList.get(userList.size() - 1).getId() + 1;

        // Create and add new user
        User newUser = new User(newId, username.trim(), password, email.trim());
        userList.add(newUser);

        // Redirect to login page
        response.sendRedirect(request.getContextPath() + "/login");
    }
} 