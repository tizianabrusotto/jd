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

    private DataSource ds;

    public DataSourceConnector() {
        ds = Config.getDataSource();
    }

    public static void main(String[] args) {
        DataSourceConnector dsc = new DataSourceConnector();

        log.trace("Connecting to the current DBMS specified by the data source");
        System.out.println(dsc.getInfo());
    }

    public String getInfo() {
        try (Connection conn = ds.getConnection()) {
            DatabaseMetaData dmd = conn.getMetaData();

            String db = dmd.getDatabaseProductName();
            String version = dmd.getDatabaseProductVersion();

            String catalog = conn.getCatalog();
            String schema = conn.getSchema();

            return String.format("Connected to %s version %s, catalog %s, schema %s", db, version, catalog, schema);
        } catch (SQLException e) {
            log.fatal("Can't get database info", e);
            return "Can't get database info";
        }
    }
}
