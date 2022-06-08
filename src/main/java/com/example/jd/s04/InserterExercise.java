package com.example.jd.s04;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import static com.example.jd.Config.*;

public class InserterExercise {
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
            throw new IllegalStateException(se);
        }
    }
}
