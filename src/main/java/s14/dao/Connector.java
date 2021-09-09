package s14.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import static jd.Config.*;

public class Connector {
    private static final Logger log = LogManager.getLogger(Connector.class);

    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException se) {
            throw new IllegalStateException("No database connection", se);
        }
    }
}
