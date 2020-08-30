package s10;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import s09.Coder;
import s09.Coder2;

public class PreparedSelector {
    private static final Logger LOG = LoggerFactory.getLogger(PreparedSelector.class);

    private static final String URL = "jdbc:mysql://localhost:3306/me?serverTimezone=Europe/Rome";
    private static final String USER = "me";
    private static final String PASSWORD = "password";

    private static final String CODERS_BY_SALARY = "SELECT first_name, last_name, salary FROM coders WHERE salary >= ? ORDER BY 3 DESC";

    public List<Coder> getCodersBySalary(double lower) throws SQLException {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                PreparedStatement prepStmt = conn.prepareStatement(CODERS_BY_SALARY)) {
            prepStmt.setDouble(1, lower);

            LOG.debug(prepStmt.toString());
            List<Coder> results = new ArrayList<>();

            try (ResultSet rs = prepStmt.executeQuery()) {
                while (rs.next()) {
                    results.add(new Coder(rs.getString(1), rs.getString(2), rs.getInt(3)));
                }
            }

            return results;
        }
    }

    public List<Coder2> getCodersWithLetterIn(char letter) throws SQLException {
        // quotation in string is managed by PreparedStatement
        final String psq = "select first_name, last_name, salary " + "from coders "
                + "where first_name like ? or last_name like ?";

        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                PreparedStatement prepStmt = conn.prepareStatement(psq)) {

            prepStmt.setString(1, "%" + letter + "%");
            prepStmt.setString(2, "%" + letter + "%");

            LOG.debug(prepStmt.toString());
            List<Coder2> results = new ArrayList<>();

            try (ResultSet rs = prepStmt.executeQuery()) {
                while (rs.next()) {
                    results.add(new Coder2(rs.getString(1), rs.getString(2), rs.getDouble(3)));
                }
            }

            return results;
        }
    }
}