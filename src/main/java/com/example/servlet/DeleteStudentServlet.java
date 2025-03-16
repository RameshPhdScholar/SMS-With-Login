package com.example.servlet;

import com.example.model.Student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;
import java.util.Iterator;

@WebServlet("/delete-student")
public class DeleteStudentServlet extends HttpServlet {
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get student ID from request parameter
        String idStr = request.getParameter("id");
        
        try {
            int id = Integer.parseInt(idStr);
            
            // Get the student list from StudentsServlet
            StudentsServlet studentsServlet = (StudentsServlet) getServletContext()
                    .getAttribute("studentsServlet");
            List<Student> studentList = studentsServlet.getStudentList();
            
            // Remove the student with the given ID
            Iterator<Student> iterator = studentList.iterator();
            while (iterator.hasNext()) {
                Student student = iterator.next();
                if (student.getId() == id) {
                    iterator.remove();
                    break;
                }
            }
        } catch (NumberFormatException e) {
            // Handle invalid ID
        }

        // Redirect back to the students list
        response.sendRedirect(request.getContextPath() + "/students");
    }
} 