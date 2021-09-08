package s09;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import static jd.Config.*;

public class PreparedSelector {
    private static final Logger log = LogManager.getLogger(PreparedSelector.class);
    private static final String CODERS_BY_SALARY = "SELECT first_name, last_name, hire_date, salary FROM coders WHERE salary >= ? ORDER BY salary DESC";
    private static final String CODERS_UP_TO_HIRE_DATE = "SELECT first_name, last_name, hire_date, salary FROM coders WHERE hire_date < ? ORDER BY hire_date";
    private static final String CODERS_BY_LETTER = "SELECT first_name, last_name, hire_date, salary FROM coders WHERE first_name LIKE ? OR last_name LIKE ?";

    public static List<Coder> getCodersHiredBefore(LocalDate limit) throws SQLException {

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement prepStmt = conn.prepareStatement(CODERS_UP_TO_HIRE_DATE)) {
            prepStmt.setObject(1, limit);

            // not supported by Oracle JDBC
            log.debug("PreparedStatement: " + prepStmt);

            List<Coder> result = new ArrayList<>();
            try (ResultSet rs = prepStmt.executeQuery()) {
                while (rs.next()) {
                    Coder coder = new Coder(rs.getString(1), rs.getString(2),
                            rs.getObject(3, LocalDate.class), rs.getInt(4));
                    result.add(coder);
                }
            }

            log.debug(result);
            return result;
        }
    }

    public List<Coder> getCodersBySalary(double lower) throws SQLException {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement prepStmt = conn.prepareStatement(CODERS_BY_SALARY)) {
            prepStmt.setDouble(1, lower);

            // not supported by Oracle JDBC
            log.debug("PreparedStatement: " + prepStmt);

            List<Coder> result = new ArrayList<>();
            try (ResultSet rs = prepStmt.executeQuery()) {
                while (rs.next()) {
                    Coder coder = new Coder(rs.getString(1), rs.getString(2),
                            rs.getObject(3, LocalDate.class), rs.getDouble(4));
                    result.add(coder);
                }
            }

            log.debug(result);
            return result;
        }
    }

    public List<Coder> getCodersWithLetterIn(char letter) throws SQLException {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement prepStmt = conn.prepareStatement(CODERS_BY_LETTER)) {

            // quotation in string is managed by PreparedStatement
            prepStmt.setString(1, "%" + letter + "%");
            prepStmt.setString(2, "%" + letter + "%");

            // not supported by Oracle JDBC
            log.debug(prepStmt);
            List<Coder> results = new ArrayList<>();

            try (ResultSet rs = prepStmt.executeQuery()) {
                while (rs.next()) {
                    Coder coder = new Coder(rs.getString(1), rs.getString(2),
                            rs.getObject(3, LocalDate.class), rs.getDouble(4));
                    results.add(coder);
                }
            }

            return results;
        }
    }
}