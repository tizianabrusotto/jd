package s11;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import static jd.Config.*;

public class Transactor {
    private static final Logger log = LogManager.getLogger(Transactor.class);

    private static final String SELECT_ALL_CODERS = "SELECT coder_id, first_name, last_name, hire_date FROM coders";
    private static final String INSERT_CODER_PREP = "INSERT INTO coders (first_name, last_name, hire_date, salary) VALUES( ?, ?, ?, ?)";

    public void logAllCoders(Statement stmt) throws SQLException {
        StringBuilder sb = new StringBuilder("[");

        try (ResultSet rs = stmt.executeQuery(SELECT_ALL_CODERS)) {
            while (rs.next()) {
                sb.append("(").append(rs.getInt("coder_id")).append(": "); // 1
                sb.append(rs.getString("first_name")).append(" "); // 2
                sb.append(rs.getString("last_name")).append(" "); // 3
                sb.append(rs.getDate("hire_date")).append(")"); // 4
            }
        } finally {
            sb.append("]");
            log.debug(sb.toString());
        }
    }

    public void insertCoder(String first, String last, double salary) {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                PreparedStatement ps = conn.prepareStatement(INSERT_CODER_PREP)) {
            conn.setAutoCommit(false);

            ps.setString(1, first);
            ps.setString(2, last);
            ps.setDate(3, java.sql.Date.valueOf(LocalDate.now()));
            ps.setDouble(4, salary);

            try {
                System.out.println("Inserting new coder ...");
                ps.executeUpdate();

                logAllCoders(ps);
                doSomethingDangerous();
                conn.commit();
                System.out.println("New coder inserted");
            } catch (Exception ex) {
                log.error("Can't insert new coder", ex);
                System.out.println("Rollback");
                conn.rollback();
                logAllCoders(ps);
                System.out.println("No coder inserted");
            }
        } catch (SQLException se) {
            log.error("DBMS error", se);
        }
    }

    public static void main(String[] args) {
        new Transactor().insertCoder("Jim", "Steward", 7000.0);
    }

    private void doSomethingDangerous() {
        throw new IllegalStateException("Something bad happened");
    }
}