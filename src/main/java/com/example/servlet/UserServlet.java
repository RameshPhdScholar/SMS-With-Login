package com.example.servlet;

import com.example.model.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/users")
public class UserServlet extends HttpServlet {
    private List<User> userList;

    @Override
    public void init() throws ServletException {
        userList = new ArrayList<>();
        // Add a default admin user
        userList.add(new User(1, "admin", "admin123", "admin@example.com"));
    }

    public List<User> getUserList() {
        return userList;
    }

    public User findUserByUsername(String username) {
        return userList.stream()
                .filter(user -> user.getUsername().equals(username))
                .findFirst()
                .orElse(null);
    }

    public boolean isUsernameAvailable(String username) {
        return findUserByUsername(username) == null;
    }

    @Override
    public void destroy() {
        userList.clear();
        userList = null;
    }
} 