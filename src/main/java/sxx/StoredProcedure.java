package sxx;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import s09.PreparedSelector;

public class StoredProcedure {
    private static Logger logger = LoggerFactory.getLogger(PreparedSelector.class);

    private static final String URL = "jdbc:mysql://localhost:3306/me?serverTimezone=Europe/Rome";
    private static final String USER = "me";
    private static final String PASSWORD = "password";

    private static final String GET_CODER_SALARY = "{call get_coder_salary(?, ?)}";

    public double getCoderSalary(int id) throws SQLException {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                CallableStatement callStmt = conn.prepareCall(GET_CODER_SALARY)) {
            callStmt.setInt(1, id);
            callStmt.registerOutParameter(2, Types.DECIMAL);

            logger.debug(callStmt.toString());
            callStmt.executeUpdate();
            return callStmt.getDouble(2);
        }
    }

    public static void main(String[] args) {
        try {
            StoredProcedure sample = new StoredProcedure();
            System.out.println("Coder salary: " + sample.getCoderSalary(107));
        } catch (SQLException e) {
            logger.error("Can't get coder salary", e);
            return;
        }
    }
}
