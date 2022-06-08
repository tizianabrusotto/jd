package com.example.jd.s05;

import java.sql.*;

import static com.example.jd.Config.*;

public class PreparedRemover {
    private static final String DELETE_SERVICE_BY_NAME = """
            DELETE FROM service
            WHERE name = ? and location_id = ?""";

    public static void main(String[] args) {
        // this info should come from user
        String name = "Smith's Barn";
        int location = 18;

        System.out.printf("Deleting service named %s, location %d, if exists%n", name, location);

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                PreparedStatement stmt = conn.prepareStatement(DELETE_SERVICE_BY_NAME)) {
            stmt.setString(1, name);
            stmt.setInt(2, location);
            int lines = stmt.executeUpdate();
            System.out.printf("Delete executed, %d lines affected%n", lines);
        } catch (SQLException se) {
            throw new IllegalStateException(se);
        }
    }
}
