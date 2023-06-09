/*
 * Java / RDBMS integration by JDBC
 * 
 * https://github.com/egalli64/jd
 */
package com.example.jd.s07;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.example.jd.Config;

/**
 * ResultSet example
 */
public class SimpleSelector {
    private static final Logger log = LogManager.getLogger(SimpleSelector.class);

    private static final String GET_CODERS = """
            SELECT employee_id, first_name, last_name
            FROM employee e JOIN department d
            USING (department_id)
            WHERE d.name = 'IT'""";

    /**
     * Run the query, print the data in the received result set
     * 
     * @param args not used
     */
    public static void main(String[] args) {
        DataSource ds = Config.getDataSource(); //connessione per andare sul database

        try (Connection conn = ds.getConnection();
                Statement stmt = conn.createStatement(); //statement sulla connection
                ResultSet rs = stmt.executeQuery(GET_CODERS)) { // esegue la query
            log.debug("Looping on the result set");
            System.out.printf("%4s %20s %20s%n", "id", "first", "last");
            
            //loop sul result set finchè ci sono righe
            while (rs.next()) {
            	//dalla riga corrente del result set prendo la prima colonna
                int id = rs.getInt(1);
                String first = rs.getString(2);
                String last = rs.getString(3);

                System.out.printf("%4d %20s %20s%n", id, first, last);
            }
            log.debug("Done");
        } catch (SQLException se) {
            log.fatal("Can't get coders", se);
        }
    }
}
