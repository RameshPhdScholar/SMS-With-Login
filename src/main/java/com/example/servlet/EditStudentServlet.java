package com.example.servlet;

import com.example.model.Student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/edit-student")
public class EditStudentServlet extends HttpServlet {
    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get student ID from request parameter
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.trim().isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/students");
            return;
        }

        try {
            int id = Integer.parseInt(idStr);
            
            // Get the student list from StudentsServlet
            StudentsServlet studentsServlet = (StudentsServlet) getServletContext()
                    .getAttribute("studentsServlet");
            List<Student> studentList = studentsServlet.getStudentList();
            
            // Find the student with the given ID
            Student studentToEdit = null;
            for (Student student : studentList) {
                if (student.getId() == id) {
                    studentToEdit = student;
                    break;
                }
            }
            
            if (studentToEdit != null) {
                request.setAttribute("student", studentToEdit);
                request.getRequestDispatcher("/edit-student.jsp").forward(request, response);
            } else {
                response.sendRedirect(request.getContextPath() + "/students");
            }
        } catch (NumberFormatException e) {
            response.sendRedirect(request.getContextPath() + "/students");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get form parameters
        String idStr = request.getParameter("id");
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String course = request.getParameter("course");

        try {
            int id = Integer.parseInt(idStr);
            
            // Get the student list from StudentsServlet
            StudentsServlet studentsServlet = (StudentsServlet) getServletContext()
                    .getAttribute("studentsServlet");
            List<Student> studentList = studentsServlet.getStudentList();
            
            // Find and update the student
            for (Student student : studentList) {
                if (student.getId() == id) {
                    student.setName(name);
                    student.setEmail(email);
                    student.setCourse(course);
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