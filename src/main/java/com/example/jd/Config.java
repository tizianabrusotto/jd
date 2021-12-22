package com.example.jd;

import java.io.InputStream;
import java.util.Properties;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public final class Config {
    private static final Logger log = LogManager.getLogger(Config.class);

    public static final Dbms ACTIVE;
    public static final String URL;
    public static final String USER;
    public static final String PASSWORD;

    private Config() {
    }

    static {
        String dbmsName = "mysql";
        String url = "jdbc:mysql://localhost:3306/hron";
        String user = "hron";
        String password = "password";

        try (InputStream is = Config.class.getClassLoader().getResourceAsStream("configuration.properties")) {
            Properties prop = new Properties();
            prop.load(is);

            dbmsName = prop.getProperty("dbms.name");
            url = prop.getProperty("dbms.url");
            user = prop.getProperty("dbms.user");
            password = prop.getProperty("dbms.password");
        } catch (Exception ex) {
            log.error("Can't load configuration properties", ex);
        } finally {
            switch (dbmsName) {
                case "oracle" -> ACTIVE = Dbms.ORACLE;
                case "postgres" -> ACTIVE = Dbms.POSTGRES;
                case "sqlite" -> ACTIVE = Dbms.SQLITE;
                default -> ACTIVE = Dbms.MYSQL;
            }

            URL = url;
            USER = user;
            PASSWORD = password;
        }
    }

    public static boolean isMySql() {
        return ACTIVE == Dbms.MYSQL;
    }

    public static boolean isOracle() {
        return ACTIVE == Dbms.ORACLE;
    }

    public static boolean isPostgres() {
        return ACTIVE == Dbms.POSTGRES;
    }

    public static boolean isSqLite() {
        return ACTIVE == Dbms.SQLITE;
    }

    public static boolean isStoredProcedureMissing() {
        return isSqLite() || isPostgres();
    }
}
