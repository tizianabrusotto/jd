package s14.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static jd.Config.*;


public class Connector {
    private static final Logger LOG = LoggerFactory.getLogger(Connector.class);

    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException se) {
            LOG.error("Can't connect to database", se);
            throw new IllegalStateException("No database connection");
        }
    }
}
