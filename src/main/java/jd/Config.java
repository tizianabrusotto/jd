package jd;

public interface Config {
    /** MySQL */
    String URL = "jdbc:mysql://localhost:3306/me";

    // or, when something like default-time-zone="+02:00" is not set in my.ini
    // String URL = "localhost:3306/me?serverTimezone=Europe/Rome";

    /** Oracle DB */
//    String URL = "jdbc:oracle:thin:@127.0.0.1:1521/xe";

    // Access to user/schema me
    String USER = "me";
    String PASSWORD = "password";
}
