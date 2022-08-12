package com.example.jd.s06;

import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.withPrecision;
import static org.junit.jupiter.api.Assertions.assertThrows;

import java.sql.SQLException;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.condition.DisabledIf;
import org.junit.jupiter.api.condition.EnabledIf;

/**
 * Assuming schema hron, table coders initialized via setup.sql script
 * 
 */
class StoredProcedureTest {
    private StoredProcedure sp;

    @BeforeEach
    void init() {
        this.sp = new StoredProcedure();
    }

    @Test
    @DisabledIf("com.example.jd.Config#isStoredProcedureMissing")
    void getEmployeeSalary() throws SQLException {
        /*-
         * # coder_id, first_name, last_name, hire_date, salary
         * 107, Diana, Lorentz, 2007-02-07, 4200.00
         */
        int coderId = 107;
        double expected = 4200.0;

        double actual = sp.getEmployeeSalary(coderId);
        assertThat(actual).isCloseTo(expected, withPrecision(0.0001));
    }

    @Test
    @EnabledIf("com.example.jd.Config#isPostgresLike")
    void getCoderSalaryFunctionPlain() throws SQLException {
        /*-
         * # coder_id, first_name, last_name, hire_date, salary
         * 107, Diana, Lorentz, 2007-02-07, 4200.00
         */
        int coderId = 107;
        double expected = 4200.0;

        double actual = sp.getSalaryByFunction(coderId);
        assertThat(actual).isCloseTo(expected, withPrecision(0.0001));
    }

    @Test
    @EnabledIf("com.example.jd.Config#isMySql")
    void getCoderSalaryMissingMySql() throws SQLException {
        int coderId = 22070;
        double expected = 0.0;

        double actual = sp.getEmployeeSalary(coderId);
        assertThat(actual).isEqualTo(expected);
    }

    @Test
    @EnabledIf("com.example.jd.Config#isOracle")
    void getCoderSalaryMissingOracle() {
        int coderId = 22070;

        var exc = assertThrows(SQLException.class, () -> sp.getEmployeeSalary(coderId));
        assertThat(exc.getErrorCode()).isEqualTo(1403);
    }
}
