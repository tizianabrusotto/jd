package s09;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.time.Month;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class Selector {
    private static Logger logger = LoggerFactory.getLogger(Selector.class);

    private static final String URL = "jdbc:mysql://localhost:3306/me?serverTimezone=Europe/Rome";
    private static final String USER = "me";
    private static final String PASSWORD = "password";

    private static final String SELECT_NAMES = "SELECT first_name FROM coders ORDER BY 1";
    private static final String SELECT_CODERS = "SELECT first_name, last_name, salary FROM coders ORDER BY 1";
    private static final String SELECT_CODERS_BY_SALARY_DOUBLE = "SELECT first_name, last_name, salary FROM coders WHERE salary >= %.0f ORDER BY 3 DESC";
    private static final String SELECT_CODERS_BY_SALARY_STRING = "SELECT first_name, last_name, salary FROM coders WHERE salary >= %s ORDER BY 3 DESC";

    public List<String> getCoderNames() throws SQLException {

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(SELECT_NAMES)) {
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
                ResultSet rs = stmt.executeQuery(SELECT_CODERS)) {
            List<Coder> results = new ArrayList<>();
            while (rs.next()) {
                Coder coder = new Coder(rs.getString(1), rs.getString(2), rs.getInt(3));
                results.add(coder);
            }

            return results;
        }
    }

    public List<Coder> getCodersBySalary(double lower) throws SQLException {
        String query = String.format(SELECT_CODERS_BY_SALARY_DOUBLE, lower);
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

    public List<Coder> getCodersBySalary(String lower) throws SQLException {
        String query = String.format(SELECT_CODERS_BY_SALARY_STRING, lower);
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

    public static List<Coder> getCodersHiredBefore(LocalDate limit) throws SQLException {
        final String query = "SELECT first_name, last_name, salary FROM coders WHERE hire_date < ? ORDER BY hire_date";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                PreparedStatement prepStmt = conn.prepareStatement(query)) {
            prepStmt.setDate(1, Date.valueOf(limit));

            logger.debug("I'm about to execute " + prepStmt);
            List<Coder> results = new ArrayList<>();

            try (ResultSet rs = prepStmt.executeQuery()) {
                while (rs.next()) {
                    results.add(new Coder(rs.getString(1), rs.getString(2), rs.getInt(3)));
                }
            }

            return results;
        }
    }

    public static void main(String[] args) {
        try {
            Selector sample = new Selector();

            System.out.println("Coder names are: " + sample.getCoderNames());
            System.out.println("Coders are: " + sample.getCoders());
            System.out.println("Rich coders are: " + sample.getCodersBySalary(6000));

            LocalDate date = LocalDate.of(2007, Month.JANUARY, 1);
            List<Coder> results = Selector.getCodersHiredBefore(date);
            System.out.println("Most senior coders are: " + results);
        } catch (SQLException e) {
            e.printStackTrace();
            return;
        }
    }
}