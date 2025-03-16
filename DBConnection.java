public class DBConnection {
    private static final String JDBC_URL = "jdbc:mysql://localhost:3306/pec";
    private static final String USERNAME = "root"; // Replace with your MySQL username
    private static final String PASSWORD = "root"; // Replace with your MySQL password

    public static java.sql.Connection getConnection() {
        java.sql.Connection connection = null;
        try {
            java.sql.DriverManager.registerDriver(new com.mysql.cj.jdbc.Driver());
            connection = java.sql.DriverManager.getConnection(JDBC_URL, USERNAME, PASSWORD);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return connection;
    }
}
