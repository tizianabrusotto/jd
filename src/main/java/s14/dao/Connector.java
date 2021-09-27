package s14.dao;

import static jd.Config.PASSWORD;
import static jd.Config.URL;
import static jd.Config.USER;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connector {
    public static Connection getConnection() {
        try {
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (SQLException se) {
            throw new IllegalStateException("No database connection", se);
        }
    }
}
