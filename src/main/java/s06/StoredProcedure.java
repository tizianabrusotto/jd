package s06;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import static jd.Config.*;

public class StoredProcedure {
    private static final Logger log = LoggerFactory.getLogger(StoredProcedure.class);
    private static final String GET_CODER_SALARY = "{call get_coder_salary(?, ?)}";

    /**
     * Coder salary
     * 
     * @param id the coder id
     * @return coder salary, 0 if the specified coder id is not available
     * @throws SQLException
     */
    public double getCoderSalary(int id) throws SQLException {
        try (Connection conn = DriverManager.getConnection(URL, USER, PASSWORD);
                CallableStatement callStmt = conn.prepareCall(GET_CODER_SALARY)) {
            callStmt.setInt(1, id);
            callStmt.registerOutParameter(2, Types.DECIMAL);

            log.debug(callStmt.toString());
            callStmt.executeUpdate();
            log.debug(callStmt.toString());

            return callStmt.getDouble(2);
        }
    }
}
