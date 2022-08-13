package com.example.jd.s06;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

import javax.sql.DataSource;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import com.example.jd.Config;

public class StoredProcedure {
    private static final Logger log = LogManager.getLogger(StoredProcedure.class);

    private static final String GET_EMPLOYEE_SALARY = "{call get_employee_salary(?, ?)}";
    private static final String GET_SALARY_FUNCTION = "{? = call get_salary(?)}";

    private DataSource ds;

    public StoredProcedure() {
        this.ds = Config.getDataSource();
    }

    /**
     * Coder salary
     * 
     * @param id the coder id
     * @return coder salary, 0 if the specified coder id is not available
     * @throws SQLException in case of problems
     */
    public double getEmployeeSalary(int id) throws SQLException {
        try (Connection conn = ds.getConnection(); //
                CallableStatement cs = conn.prepareCall(GET_EMPLOYEE_SALARY)) {
            cs.setInt(1, id);
            cs.registerOutParameter(2, Types.DECIMAL);

            log.debug("Before execute: {}", cs);
            cs.executeUpdate();
            log.debug("After execute: {}", cs);

            double result = cs.getDouble(2);
            log.debug("Result is: {}", cs);

            return result;
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
        try (Connection conn = ds.getConnection(); //
                CallableStatement cs = conn.prepareCall(GET_SALARY_FUNCTION)) {
            log.debug("Prepared: " + cs.toString());

            cs.registerOutParameter(1, Types.DECIMAL);
            cs.setInt(2, id);

            log.debug("Before execute: {}", cs);
            cs.executeUpdate();
            log.debug("After execute: {}", cs);

            double result = cs.getBigDecimal(1).doubleValue();
            log.debug("Result is: {}", result);

            return result;
        }
    }
}
