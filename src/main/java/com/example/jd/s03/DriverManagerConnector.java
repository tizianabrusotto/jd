package com.example.jd.s03;

import static com.example.jd.Config.PASSWORD;
import static com.example.jd.Config.URL;
import static com.example.jd.Config.USER;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.DriverManager;
import java.sql.SQLException;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;;

public class DriverManagerConnector {
    private static final Logger log = LogManager.getLogger(DriverManagerConnector.class);

    public static void main(String[] args) {
        log.trace("Connecting ... (legacy)");
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);) {
            DatabaseMetaData dmd = conn.getMetaData();

            String db = dmd.getDatabaseProductName();
            String version = dmd.getDatabaseProductVersion();

            String catalog = conn.getCatalog();
            String schema = conn.getSchema();

            System.out.printf("Connected to %s version %s, catalog %s, schema %s", db, version, catalog, schema);
        } catch (SQLException e) {
            log.fatal("Can't get database info", e);
            System.out.println("Can't get database info");
        }
    }
}
