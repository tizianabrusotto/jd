package com.example.jd.s05;

import static com.example.jd.Config.PASSWORD;
import static com.example.jd.Config.URL;
import static com.example.jd.Config.USER;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class PreparedRemover {
    private static final Logger log = LogManager.getLogger(PreparedRemover.class);
    private static final String DELETE_SERVICE_BY_NAME = """
            DELETE FROM service
            WHERE name = ? and location_id = ?""";

    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Pass me a service name and its location!");
            return;
        }

        String name = args[0];
        // TODO: robustness, try for NumberFormatException
        int location = Integer.valueOf(args[1]);

        log.info("Deleting service named <{}>, location <{}>, if exists", name, location);

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                PreparedStatement stmt = conn.prepareStatement(DELETE_SERVICE_BY_NAME)) {
            stmt.setString(1, name);
            stmt.setInt(2, location);
            int lines = stmt.executeUpdate();
            System.out.printf("Delete executed, %d lines affected%n", lines);
        } catch (SQLException se) {
            log.error("Can't remove", se);
        }
    }
}
