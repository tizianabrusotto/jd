package com.example.jd.s04;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import static com.example.jd.Config.*;

public class Remover {
    private static final String DELETE_SERVICE_BY_NAME = "DELETE FROM service WHERE name = '%s'";

    public static void main(String[] args) {
        if (args.length == 0) {
            System.out.println("Pass me a service name!");
            return;
        }

        String name = args[0];
        System.out.printf("Deleting service named %s, if exists%n", name);

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                Statement stmt = conn.createStatement()) {
            String sql = String.format(DELETE_SERVICE_BY_NAME, name);
            int lines = stmt.executeUpdate(sql);
            System.out.printf("Delete executed, %d lines affected%n", lines);
        } catch (SQLException se) {
            throw new IllegalStateException(se);
        }
    }
}
