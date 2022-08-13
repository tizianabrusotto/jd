package com.example.jd.s04;

import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.example.jd.Config;

public class InserterExercise {
    private static final Logger log = LogManager.getLogger(InserterExercise.class);

    // TODO: SQL code for insert
//    private static final String INSERT_SERVICE_BY_NAME_AND_LOCATION = "";

    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Pass me a service name and its location!");
            return;
        }

        DataSource ds = Config.getDataSource();
        try (Connection conn = ds.getConnection(); Statement stmt = conn.createStatement()) {
            // TODO: execute statement
        } catch (SQLException se) {
            log.fatal("Can't remove", se);
        }
    }
}
