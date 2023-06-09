/*
 * Java / RDBMS integration by JDBC
 * 
 * https://github.com/egalli64/jd
 */
package com.example.jd.s03;

import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.example.jd.Config;

/**
 * A Hello JDBC by data source
 */
public class DataSourceConnector {
    private static final Logger log = LogManager.getLogger(DataSourceConnector.class);

    /**
     * Connect to the current data source, get and log DB info then terminate
     * 
     * @param args not used
     */
    public static void main(String[] args) {
        log.trace("Connecting ..."); 
        DataSource ds = Config.getDataSource(); //lo vado a prendere dal config

        try (Connection conn = ds.getConnection()) { //crea una connessione che ti da il datasource invocando il metodo getConnection
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
