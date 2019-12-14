package s14.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

public class CoderDao implements Dao<Coder> {
    private static final String GET_BY_PK = "SELECT coder_id, first_name, last_name, salary FROM coders WHERE coder_id = ?";
    private static final String GET_ALL = "SELECT coder_id, first_name, last_name, salary FROM coders";

    @Override
    public Optional<Coder> get(long id) {
        Connection conn = Connector.getConnection();

        try (PreparedStatement ps = conn.prepareStatement(GET_BY_PK)) {
            ps.setLong(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return Optional.of(new Coder(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getDouble(4)));
            }
        } catch (SQLException se) {
            se.printStackTrace();
        }

        return Optional.empty();
    }

    @Override
    public List<Coder> getAll() {
        Connection conn = Connector.getConnection();

        List<Coder> results = new ArrayList<>();

        try (Statement stmt = conn.createStatement()) {
            ResultSet rs = stmt.executeQuery(GET_ALL);

            while (rs.next()) {
                Coder coder = new Coder(rs.getLong(1), rs.getString(2), rs.getString(3), rs.getDouble(4));
                results.add(coder);
            }
        } catch (SQLException se) {
            se.printStackTrace();
        }

        return results;
    }

    @Override
    public void save(Coder coder) {
        // TODO Auto-generated method stub
    }

    @Override
    public void update(Coder coder) {
        // TODO Auto-generated method stub
    }

    @Override
    public void delete(long id) {
        // TODO Auto-generated method stub
    }
}
