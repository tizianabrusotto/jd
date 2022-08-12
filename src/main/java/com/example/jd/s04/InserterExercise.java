package com.example.jd.s04;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import static com.example.jd.Config.*;

public class InserterExercise {
    private static final Logger log = LogManager.getLogger(InserterExercise.class);

    // TODO: SQL code for insert
//    private static final String INSERT_SERVICE_BY_NAME_AND_LOCATION = "";

    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Pass me a service name and its location!");
            return;
        }

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                Statement stmt = conn.createStatement()) {
            // TODO: execute statement
        } catch (SQLException se) {
            log.error("Can't remove", se);
        }
    }
}
