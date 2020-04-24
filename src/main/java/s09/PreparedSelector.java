package s09;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import s08.Coder;

public class PreparedSelector {
    private static Logger logger = LoggerFactory.getLogger(PreparedSelector.class);

    private static final String URL = "jdbc:mysql://localhost:3306/me?serverTimezone=Europe/Rome";
    private static final String USER = "me";
    private static final String PASSWORD = "password";

    private static final String CODERS_BY_SALARY = "SELECT first_name, last_name, salary FROM coders WHERE salary >= ? ORDER BY 3 DESC";

    public List<Coder> getCodersBySalary(double lower) throws SQLException {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                PreparedStatement prepStmt = conn.prepareStatement(CODERS_BY_SALARY)) {
            prepStmt.setDouble(1, lower);

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
            PreparedSelector sample = new PreparedSelector();
            System.out.println("Rich coders are: " + sample.getCodersBySalary(6000));
        } catch (SQLException e) {
            logger.error("Can't get coders", e);
            return;
        }
    }
}