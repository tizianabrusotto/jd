package com.example.jd.s03;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

import static com.example.jd.Config.*;

public class DriverManagerConnector {
    /**
     * The following static initializer should not be required anymore
     */
//    static {
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            // Class.forName("oracle.jdbc.OracleDriver");
//            // Class.forName("org.postgresql.Driver);
//        } catch (ClassNotFoundException cnfe) {
//            cnfe.printStackTrace();
//            throw new IllegalStateException("Can't load JDBC driver " + cnfe.getMessage());
//        }
//    }
    public static void main(String[] args) {
        System.out.println(getInfo());
    }

    public static String getInfo() {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD)) {
            DatabaseMetaData dmd = conn.getMetaData();

            String db = dmd.getDatabaseProductName();
            String version = dmd.getDatabaseProductVersion();

            // MySQL, PostgreSQL approach
            String schema = conn.getCatalog();
            if (schema == null) {
                // Oracle approach
                schema = conn.getSchema();
                // SQLite approach
                if (schema == null) {
                    schema = "N/A";
                }
            }

            return String.format("Connected to %s version %s, schema %s", db, version, schema);
        } catch (SQLException e) {
            throw new IllegalStateException("Can't get database info", e);
        }
    }
}
