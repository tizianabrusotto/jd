package s10;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import java.sql.*;
import java.time.LocalDate;

import static jd.Config.*;

public class Transactor {
    private static final Logger log = LogManager.getLogger(Transactor.class);

    private static final String ALL_CODERS = "SELECT coder_id, first_name, last_name, hire_date FROM coders";
    private static final String INSERT_CODER = "INSERT INTO coders (first_name, last_name, hire_date, salary) VALUES( ?, ?, ?, ?)";
    private static final String UPDATE_CODER_NAME = "UPDATE coders SET first_name = ? WHERE first_name = ? AND last_name = ?";

    public static void main(String[] args) {
        Transactor transactor = new Transactor();

        transactor.insertCoder("Jim", "Steward", 7000.0);
        transactor.insertUpdateCoder("John", "Watson", 6500.0);
        transactor.sloppyUpdate("Valli", "Pataballa");

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            transactor.logAllCoders(connection);
        } catch (Exception se) {
            log.error("DBMS error", se);
        }

    }

    public void logAllCoders(Connection conn) throws SQLException {
        StringBuilder sb = new StringBuilder("[");

        try (Statement stmt = conn.createStatement(); //
             ResultSet rs = stmt.executeQuery(ALL_CODERS)) {
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
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            conn.setAutoCommit(false);

            try {
                System.out.println("Inserting new coder ...");
                doInsert(conn, first, last, salary);

                doSomethingDangerous();
                conn.commit();
                System.out.println("New coder inserted");
            } catch (Exception ex) {
                log.error("Can't insert new coder", ex);
                System.out.println("Rollback");
                conn.rollback();
                logAllCoders(conn);
                System.out.println("No coder inserted");
            }
        } catch (Exception se) {
            log.error("DBMS error", se);
        }
    }

    public void insertUpdateCoder(String first, String last, double salary) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            connection.setAutoCommit(false);

            System.out.println("Inserting new coder ...");
            doInsert(connection, first, last, salary);

            System.out.println("Setting savepoint");
            Savepoint savepoint = connection.setSavepoint();

            System.out.println("Updating coder ...");
            doUpdate(connection, first, last);

            try {
                doSomethingDangerous();
                connection.commit();
                System.out.println("Insert plus update committed");
            } catch (Exception ex) {
                log.error("Can't update coder", ex);
                System.out.println("Rollback update");
                connection.rollback(savepoint);
                System.out.println("Update rolled back");
                logAllCoders(connection);
            }

            System.out.println("Final rollback");
            connection.rollback();
            logAllCoders(connection);
        } catch (Exception se) {
            log.error("DBMS error", se);
        }
    }

    public void sloppyUpdate(String first, String last) {
        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD)) {
            connection.setAutoCommit(false);

            System.out.println("Updating coder ...");
            doUpdate(connection, first, last);

            System.out.println("VERY BAD: no commit, implicit rollback!");
        } catch (Exception se) {
            log.error("DBMS error", se);
        }
    }

    private void doInsert(Connection connection, String first, String last, double salary) {
        try (PreparedStatement ps = connection.prepareStatement(INSERT_CODER)) {
            ps.setString(1, first);
            ps.setString(2, last);
            ps.setObject(3, LocalDate.now());
            ps.setDouble(4, salary);
            ps.executeUpdate();
            logAllCoders(connection);
        } catch (SQLException se) {
            throw new IllegalStateException(se);
        }
    }

    private void doUpdate(Connection connection, String first, String last) {
        try (PreparedStatement ps = connection.prepareStatement(UPDATE_CODER_NAME)) {
            ps.setString(1, first + "ny");
            ps.setString(2, first);
            ps.setString(3, last);
            ps.executeUpdate();
            logAllCoders(connection);
        } catch (SQLException se) {
            throw new IllegalStateException(se);
        }
    }

    private void doSomethingDangerous() {
        throw new IllegalStateException("Something bad happened");
    }
}