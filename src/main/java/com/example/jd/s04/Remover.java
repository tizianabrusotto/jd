package com.example.jd.s04;

import static com.example.jd.Config.PASSWORD;
import static com.example.jd.Config.URL;
import static com.example.jd.Config.USER;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class Remover {
    private static final Logger log = LogManager.getLogger(Remover.class);
    private static final String DELETE_SERVICE_BY_NAME = "DELETE FROM service WHERE name = '%s'";

    public static void main(String[] args) {
        if (args.length == 0) {
            System.out.println("Pass me a service name!");
            return;
        }

        log.info("Deleting service named {}, if exists", args[0]);

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                Statement stmt = conn.createStatement()) {
            // !!! DANGER - POSSIBLE SQL INJECTION ATTACK !!!
            String sql = String.format(DELETE_SERVICE_BY_NAME, args[0]);
            int lines = stmt.executeUpdate(sql);
            System.out.printf("Delete executed, %d lines affected%n", lines);
        } catch (SQLException se) {
            log.error("Can't remove", se);
        }
    }
}
