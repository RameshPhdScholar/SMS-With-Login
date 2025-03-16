package com.example.servlet;

import com.example.model.Student;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/students")
public class StudentsServlet extends HttpServlet {
    private List<Student> studentList = new ArrayList<>();

    @Override
    public void init() throws ServletException {
        // Add some sample data
        studentList.add(new Student(1, "John Doe", "john@example.com", "Computer Science"));
        studentList.add(new Student(2, "Jane Smith", "jane@example.com", "Mathematics"));
        studentList.add(new Student(3, "Bob Wilson", "bob@example.com", "Physics"));
        
        // Register this servlet in the context
        getServletContext().setAttribute("studentsServlet", this);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("students", studentList);
        request.getRequestDispatcher("/students.jsp").forward(request, response);
    }

    // Getter for the student list
    public List<Student> getStudentList() {
        return studentList;
    }
} 