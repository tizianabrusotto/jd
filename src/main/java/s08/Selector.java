package s08;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import static jd.Config.*;

public class Selector {
    private static final Logger log = LogManager.getLogger(Selector.class);
    private static final String CODER_NAMES = "SELECT first_name FROM coders ORDER BY first_name";
    private static final String CODERS_ORDERED = "SELECT first_name, last_name, salary FROM coders ORDER BY first_name";
    private static final String CODERS_BY_SALARY_DOUBLE = "SELECT first_name, last_name, salary FROM coders WHERE salary >= %d ORDER BY 3 DESC";
    private static final String CODERS_BY_SALARY_STRING = "SELECT first_name, last_name, salary FROM coders WHERE salary >= %s ORDER BY 3 DESC";
    private static final String CODERS_BY_LETTER = "SELECT first_name, last_name, salary FROM coders WHERE first_name LIKE '%%%c%%' or last_name LIKE '%%%c%%'";

    public List<String> getCoderNames() throws SQLException {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(CODER_NAMES)) {
            List<String> results = new ArrayList<>();
            while (rs.next()) {
                String current = rs.getString(1);
                results.add(current);
            }

            return results;
        }
    }

    public List<Coder> getCoders() throws SQLException {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(CODERS_ORDERED)) {
            List<Coder> results = new ArrayList<>();
            while (rs.next()) {
                Coder coder = new Coder(rs.getString(1), rs.getString(2), rs.getInt(3));
                results.add(coder);
            }

            return results;
        }
    }

    public List<Coder> getCodersBySalary(int lower) throws SQLException {
        String query = String.format(CODERS_BY_SALARY_DOUBLE, lower);
        log.debug("Formatted query: " + query);

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
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
        String query = String.format(CODERS_BY_SALARY_STRING, lower);
        log.debug("Formatted query: " + query);

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
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
        String query = String.format(CODERS_BY_LETTER, letter, letter);
        log.debug("Formatted query: " + query);

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
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