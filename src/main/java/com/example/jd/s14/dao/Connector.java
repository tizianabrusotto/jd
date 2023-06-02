/*
 * Java / RDBMS integration by JDBC
 * 
 * https://github.com/egalli64/jd
 */
package com.example.jd.s14.dao;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import com.example.jd.Config;

public class Connector {
    private static DataSource ds = Config.getDataSource();

    public static Connection getConnection() {
        try {
            return ds.getConnection();
        } catch (SQLException se) {
            throw new IllegalStateException("No database connection", se);
        }
    }
}
