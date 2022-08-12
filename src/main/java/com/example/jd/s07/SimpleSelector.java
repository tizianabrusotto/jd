package com.example.jd.s07;

import static com.example.jd.Config.PASSWORD;
import static com.example.jd.Config.URL;
import static com.example.jd.Config.USER;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class SimpleSelector {
    private static final Logger log = LogManager.getLogger(SimpleSelector.class);

    private static final String GET_CODERS = """
            SELECT employee_id, first_name, last_name
            FROM employee e JOIN department d
            USING (department_id)
            WHERE d.name = 'IT'""";

    public static void main(String[] args) {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(GET_CODERS)) {
            log.debug("Looping on the result set");
            System.out.printf("%4s %20s %20s%n", "id", "first", "last");

            while (rs.next()) {
                int id = rs.getInt(1);
                String first = rs.getString(2);
                String last = rs.getString(3);

                System.out.printf("%4d %20s %20s%n", id, first, last);
            }
            log.debug("Done");
        } catch (SQLException se) {
            log.fatal("Can't get coders", se);
        }
    }
}
