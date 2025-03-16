import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/add_student")
public class AddStudentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get form data
        String name = request.getParameter("name");
        String email = request.getParameter("email");

        // Input validation
        if (name == null || name.trim().isEmpty()) {
            response.getWriter().println("Error: Name cannot be empty.");
            return;
        }
        if (email == null || email.trim().isEmpty()) {
            response.getWriter().println("Error: Email cannot be empty.");
            return;
        }
        if (!email.matches("[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\\.[a-zA-Z]{2,}")) {
            response.getWriter().println("Error: Invalid email format.");
            return;
        }

        // Process the data (e.g., save to database)
        try {
            java.sql.Connection connection = DBConnection.getConnection();
            String sql = "INSERT INTO students (name, email) VALUES (?, ?)";
            java.sql.PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1, name);
            statement.setString(2, email);
            statement.executeUpdate();
            connection.close();
            response.getWriter().println("Student added successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            response.getWriter().println("Failed to add student: " + e.getMessage());
        }
    }
}
