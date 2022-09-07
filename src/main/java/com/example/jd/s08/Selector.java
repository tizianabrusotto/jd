package com.example.jd.s08;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.example.jd.Config;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

public class Selector {
    private static final Logger log = LogManager.getLogger(Selector.class);

    private static final String GET_CODER_NAMES = """
            SELECT first_name
            FROM employee e JOIN department d
            USING (department_id)
            WHERE d.name = 'IT'
            ORDER BY first_name""";
    private static final String GET_CODERS = """
            SELECT first_name, last_name, salary
            FROM employee e JOIN department d
            USING (department_id)
            WHERE d.name = 'IT'
            ORDER BY first_name""";
    private static final String GET_CODERS_BY_SALARY_INT = """
            SELECT first_name, last_name, salary
            FROM employee e JOIN department d
            USING (department_id)
            WHERE d.name = 'IT' AND salary >= %d
            ORDER BY salary DESC""";
    private static final String GET_CODERS_BY_SALARY_STRING = """
            SELECT first_name, last_name, salary
            FROM employee e LEFT OUTER JOIN department d
            USING (department_id)
            WHERE d.name = 'IT' AND salary >= %s
            ORDER BY salary DESC""";
    private static final String GET_CODERS_BY_LETTER = """
            SELECT first_name, last_name, salary
            FROM employee e JOIN department d
            USING (department_id)
            WHERE d.name = 'IT' AND (first_name LIKE '%%%c%%' or last_name LIKE '%%%c%%')
            ORDER BY salary DESC""";

    private DataSource ds;

    public Selector() {
        this.ds = Config.getDataSource();
    }

    public List<String> getCoderNames() throws SQLException {
        try (Connection conn = ds.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(GET_CODER_NAMES)) {
            List<String> results = new ArrayList<>();
            while (rs.next()) {
                String current = rs.getString(1);
                results.add(current);
            }

            return results;
        }
    }

    public List<Coder> getCoders() throws SQLException {
        try (Connection conn = ds.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(GET_CODERS)) {
            List<Coder> results = new ArrayList<>();
            while (rs.next()) {
                Coder coder = new Coder(rs.getString(1), rs.getString(2), rs.getInt(3));
                results.add(coder);
            }

            return results;
        }
    }

    public List<Coder> getCodersBySalary(int lower) throws SQLException {
        String query = String.format(GET_CODERS_BY_SALARY_INT, lower);
        log.debug("Formatted query: " + query);

        try (Connection conn = ds.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {
            List<Coder> results = new ArrayList<>();
            while (rs.next()) {
                results.add(new Coder(rs.getString(1), rs.getString(2), rs.getInt(3)));
            }

            return results;
        }
    }

    /*
     * DANGER! SQL Injection!
     */
    public List<Coder> getCodersBySalary(String lower) throws SQLException {
        String query = String.format(GET_CODERS_BY_SALARY_STRING, lower);
        log.debug("Formatted query: " + query);

        try (Connection conn = ds.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {
            List<Coder> results = new ArrayList<>();
            while (rs.next()) {
                results.add(new Coder(rs.getString(1), rs.getString(2), rs.getInt(3)));
            }

            return results;
        }
    }

    public List<Coder> getCodersWithLetterIn(char letter) throws SQLException {
        String query = String.format(GET_CODERS_BY_LETTER, letter, letter);
        log.debug("Formatted query: " + query);

        try (Connection conn = ds.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {

            List<Coder> results = new ArrayList<>();
            while (rs.next()) {
                results.add(new Coder(rs.getString(1), rs.getString(2), rs.getInt(3)));
            }

            return results;
        }
    }
}
