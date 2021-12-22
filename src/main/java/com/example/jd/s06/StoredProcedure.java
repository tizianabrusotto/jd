package com.example.jd.s06;

import static com.example.jd.Config.PASSWORD;
import static com.example.jd.Config.URL;
import static com.example.jd.Config.USER;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class StoredProcedure {
    private static final Logger log = LogManager.getLogger(StoredProcedure.class);
    private static final String GET_EMPLOYEE_SALARY = "{call get_employee_salary(?, ?)}";
    private static final String GET_SALARY_FUNCTION = "{? = call get_salary(?)}";

    /**
     * Coder salary
     * 
     * @param id the coder id
     * @return coder salary, 0 if the specified coder id is not available
     * @throws SQLException in case of problems
     */
    public double getEmployeeSalary(int id) throws SQLException {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                CallableStatement cs = conn.prepareCall(GET_EMPLOYEE_SALARY)) {
            cs.setInt(1, id);
            cs.registerOutParameter(2, Types.DECIMAL);

            log.debug("Before execute: " + cs);
            cs.executeUpdate();
            log.debug("After execute: " + cs);

            return cs.getDouble(2);
        }
    }

    /**
     * Coder salary
     *
     * @param id the coder id
     * @return coder salary, 0 if the specified coder id is not available
     * @throws SQLException in case of problems
     */
    public double getSalaryByFunction(int id) throws SQLException {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
             CallableStatement cs = conn.prepareCall(GET_SALARY_FUNCTION)) {
            log.debug("Prepared: " + cs.toString());

            cs.registerOutParameter(1, Types.NUMERIC);
            cs.setInt(2, id);

            log.debug("Before execute: " + cs);
            cs.executeUpdate();
            log.debug("After execute: " + cs);

            return cs.getBigDecimal(1).doubleValue();
        }
    }
}
