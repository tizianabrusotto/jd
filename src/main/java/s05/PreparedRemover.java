package s05;

import java.sql.*;

import static jd.Config.*;

public class PreparedRemover {
    private static final String DELETE_SERVICE_BY_NAME = "DELETE FROM service WHERE name = ?";

    public static void main(String[] args) {
        // this info should come from user
        String name = "Smith's Barn";

        System.out.printf("Deleting service named %s, if exists%n", name);

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(DELETE_SERVICE_BY_NAME)) {
            stmt.setString(1, name);
            int lines = stmt.executeUpdate();
            System.out.printf("Delete executed, %d lines affected%n", lines);
        } catch (SQLException se) {
            throw new IllegalStateException(se);
        }
    }
}
