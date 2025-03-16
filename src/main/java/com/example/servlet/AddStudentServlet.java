package com.example.servlet;

import com.example.model.Student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/add-student")
public class AddStudentServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Forward to the add student form
        request.getRequestDispatcher("/add-student.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        // Validate input
        if (name == null || email == null || course == null ||
            name.trim().isEmpty() || email.trim().isEmpty() || course.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/add-student");
            return;
        }

        // Get the student list from StudentsServlet
        StudentsServlet studentsServlet = (StudentsServlet) getServletContext()
                .getAttribute("studentsServlet");
        List<Student> studentList = studentsServlet.getStudentList();

        // Generate a new ID (use the size of the list + 1 as a simple way to generate IDs)
        int newId = studentList.isEmpty() ? 1 : 
                   studentList.get(studentList.size() - 1).getId() + 1;

        // Create and add the new student
        Student newStudent = new Student(newId, name.trim(), email.trim(), course.trim());
        studentList.add(newStudent);

        // Redirect back to the students list
        response.sendRedirect(request.getContextPath() + "/students");
    }
} 