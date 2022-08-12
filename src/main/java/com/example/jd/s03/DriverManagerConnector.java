package com.example.jd.s03;

import static com.example.jd.Config.PASSWORD;
import static com.example.jd.Config.URL;
import static com.example.jd.Config.USER;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class DriverManagerConnector {
    private static final Logger log = LogManager.getLogger(DriverManagerConnector.class);

    /**
     * The following static initializer should not be required here
     */
//    static {
//        try {
//            // Class.forName("org.h2.Driver");
//            // Class.forName("com.mysql.cj.jdbc.Driver");
//            // Class.forName("oracle.jdbc.OracleDriver");
//            Class.forName("org.postgresql.Driver);
//        } catch (ClassNotFoundException cnfe) {
//            cnfe.printStackTrace();
//            throw new IllegalStateException("Can't load JDBC driver " + cnfe.getMessage());
//        }
//    }

    public static void main(String[] args) {
        log.trace("Connecting to " + URL + " as user " + USER);
        System.out.println(getInfo());
    }

    public static String getInfo() {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            DatabaseMetaData dmd = conn.getMetaData();

            String db = dmd.getDatabaseProductName();
            String version = dmd.getDatabaseProductVersion();

            String catalog = conn.getCatalog();
            String schema = conn.getSchema();

            return String.format("Connected to %s version %s, catalog %s, schema %s", db, version, catalog, schema);
        } catch (SQLException e) {
            log.error("Can't get database info", e);
            return "Can't get database info";
        }
    }
}
