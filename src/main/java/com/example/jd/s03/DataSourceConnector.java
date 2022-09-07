package com.example.jd.s03;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.example.jd.Config;

public class DataSourceConnector {
    private static final Logger log = LogManager.getLogger(DataSourceConnector.class);

    public static void main(String[] args) {
        log.trace("Connecting ...");
        DataSource ds = Config.getDataSource();

        try (Connection conn = ds.getConnection()) {
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
