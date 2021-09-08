package s04;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import static jd.Config.*;

public class CoderRemover {
    private static final String DELETE_CODER_BY_NAME = "DELETE FROM coders WHERE first_name = '%s' AND last_name = '%s'";

    public static void main(String[] args) {
        // these data should come from user
        String first = "Robert";
        String last = "Smith";

        System.out.printf("Deleting coder named %s %s, if exists%n", first, last);

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement stmt = conn.createStatement()) {
            String sql = String.format(DELETE_CODER_BY_NAME, first, last);
            int lines = stmt.executeUpdate(sql);
            System.out.printf("Delete executed, %d lines affected%n", lines);
        } catch (SQLException se) {
            throw new IllegalStateException(se);
        }
    }
}
