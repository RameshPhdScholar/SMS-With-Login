# Student Management System - Project Structure

## Overview
This is a Java web application for managing student information using Java Servlets, JSP, and MySQL database.

## Project Organization

```
student-management/
├── src/
│   ├── main/
│   │   ├── java/
│   │   │   └── com/
│   │   │       └── example/
│   │   │           ├── database/
│   │   │           │   └── DatabaseConnection.java
│   │   │           ├── model/
│   │   │           │   └── Student.java
│   │   │           ├── dao/
│   │   │           │   └── StudentDAO.java
│   │   │           └── servlet/
│   │   │               ├── AddStudentServlet.java
│   │   │               ├── UpdateStudentServlet.java
│   │   │               ├── DeleteStudentServlet.java
│   │   │               └── ListStudentServlet.java
│   │   ├── webapp/
│   │   │   ├── WEB-INF/
│   │   │   │   ├── web.xml
│   │   │   │   └── views/
│   │   │   │       ├── list-students.jsp
│   │   │   │       ├── add-student.jsp
│   │   │   │       └── edit-student.jsp
│   │   │   ├── css/
│   │   │   │   └── style.css
│   │   │   └── index.jsp
│   │   └── resources/
│   │       └── database.properties
│   └── test/
│       └── java/
│           └── com/
│               └── example/
│                   └── test/
└── pom.xml
```

## Directory Structure Explanation

### Source Code (`src/main/java/`)
- `com.example.database`: Database connection and configuration
- `com.example.model`: Data models/entities
- `com.example.dao`: Data Access Objects for database operations
- `com.example.servlet`: Servlet classes handling HTTP requests

### Web Resources (`src/main/webapp/`)
- `WEB-INF/`: Protected web resources
  - `views/`: JSP pages
  - `web.xml`: Web application deployment descriptor
- `css/`: Stylesheets
- `index.jsp`: Application entry point

### Configuration
- `src/main/resources/`: Configuration files
- `pom.xml`: Maven project configuration and dependencies

## Key Components

### Database Layer
- `DatabaseConnection.java`: Manages database connections
- `StudentDAO.java`: Handles CRUD operations for student data

### Model Layer
- `Student.java`: Student entity class

### Controller Layer (Servlets)
- `AddStudentServlet.java`: Handles student creation
- `UpdateStudentServlet.java`: Handles student updates
- `DeleteStudentServlet.java`: Handles student deletion
- `ListStudentServlet.java`: Displays student list

### View Layer (JSP)
- `list-students.jsp`: Displays all students
- `add-student.jsp`: Form for adding new students
- `edit-student.jsp`: Form for editing existing students

## Dependencies
- Java Servlet API
- JSP API
- MySQL Connector
- JUnit (for testing)

## Build Tool
- Maven for dependency management and build automation
- WAR packaging for web deployment 