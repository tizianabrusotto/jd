package jd;

import java.io.InputStream;
import java.util.Properties;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public abstract class Config {
    private static final Logger log = LoggerFactory.getLogger(Config.class);

    public static final Dbms active;
    public static final String URL;
    public static final String USER;
    public static final String PASSWORD;

    static {
        String dbmsName = "mysql";
        String url = "jdbc:mysql://localhost:3306/me";
        String user = "me";
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
            case "oracle":
                active = Dbms.ORACLE;
                break;
            case "postgres":
                active = Dbms.POSTGRES;
                break;
            case "sqlite":
                active = Dbms.SQLITE;
                break;
            case "mysql":
                // fall through
            default:
                active = Dbms.MYSQL;
                break;
            }

            URL = url;
            USER = user;
            PASSWORD = password;
        }
    }

    public static boolean isMySql() {
        return active == Dbms.MYSQL;
    }

    public static boolean isOracle() {
        return active == Dbms.ORACLE;
    }

    public static boolean isPostgres() {
        return active == Dbms.POSTGRES;
    }

    public static boolean isSqLite() {
        return active == Dbms.SQLITE;
    }

    public static boolean isStoredProcedureMissing() {
        return isSqLite() || isPostgres();
    }
}
