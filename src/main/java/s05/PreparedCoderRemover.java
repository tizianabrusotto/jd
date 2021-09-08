package s05;

import java.sql.*;

import static jd.Config.*;

public class PreparedCoderRemover {
    private static final String DELETE_CODER_BY_NAME = "DELETE FROM coders WHERE first_name = ? AND last_name = ?";

    public static void main(String[] args) {
        // these data should come from user
        String first = "Robert";
        String last = "Smith";

        System.out.printf("Deleting coder named %s %s, if exists%n", first, last);

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement stmt = conn.prepareStatement(DELETE_CODER_BY_NAME)) {
            stmt.setString(1, first);
            stmt.setString(2, last);
            int lines = stmt.executeUpdate();
            System.out.printf("Delete executed, %d lines affected%n", lines);
        } catch (SQLException se) {
            throw new IllegalStateException(se);
        }
    }
}
