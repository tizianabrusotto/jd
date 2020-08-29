package s06;

import static org.hamcrest.MatcherAssert.assertThat;
import static org.hamcrest.Matchers.closeTo;
import static org.hamcrest.Matchers.is;

import java.sql.SQLException;

import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

/**
 * Assuming schema me, table coders initialized via migration.sql script
 * 
 */
class StoredProcedureTest {
    private StoredProcedure sp;

    @BeforeEach
    void init() {
        this.sp = new StoredProcedure();
    }

    @Test
    void getCoderSalaryPlain() throws SQLException {

        /*-
         * # coder_id, first_name, last_name, hire_date, salary
         * 107, Diana, Lorentz, 2007-02-07, 4210.00
         */
        int coderId = 107;
        double expected = 4210.0;

        double actual = sp.getCoderSalary(coderId);
        assertThat(actual, closeTo(expected, 0.0001));
    }

    @Test
    void getCoderSalaryMissing() throws SQLException {
        int coderId = 22070;
        double expected = 0.0;

        double actual = sp.getCoderSalary(coderId);
        assertThat(actual, is(expected));
    }}
