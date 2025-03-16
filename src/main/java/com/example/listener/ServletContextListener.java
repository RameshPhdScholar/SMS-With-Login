package com.example.listener;

import com.example.servlet.UserServlet;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.annotation.WebListener;

@WebListener
public class ServletContextListener implements javax.servlet.ServletContextListener {
    
    @Override
    public void contextInitialized(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        
        // Initialize UserServlet
        UserServlet userServlet = new UserServlet();
        try {
            userServlet.init();
            context.setAttribute("userServlet", userServlet);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    
    @Override
    public void contextDestroyed(ServletContextEvent sce) {
        ServletContext context = sce.getServletContext();
        
        // Clean up UserServlet
        UserServlet userServlet = (UserServlet) context.getAttribute("userServlet");
        if (userServlet != null) {
            userServlet.destroy();
        }
    }
} 