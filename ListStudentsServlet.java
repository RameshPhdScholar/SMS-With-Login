import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/list_students")
public class ListStudentsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            java.sql.Connection connection = DBConnection.getConnection();
            String sql = "SELECT * FROM students";
            java.sql.Statement statement = connection.createStatement();
            java.sql.ResultSet resultSet = statement.executeQuery(sql);

            List<String> studentList = new ArrayList<>();
            while (resultSet.next()) {
                String name = resultSet.getString("name");
                String email = resultSet.getString("email");
                studentList.add("Name: " + name + ", Email: " + email);
            }

            request.setAttribute("students", studentList);
            request.getRequestDispatcher("list_students.html").forward(request, response);

            connection.close();
        } catch (Exception e) {
            // Log the exception for debugging purposes
            e.printStackTrace();
            response.getWriter().println("Error listing students: An error occurred while retrieving student data.");
        }
    }
}
