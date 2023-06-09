/*
 * Java / RDBMS integration by JDBC
 * 
 * https://github.com/egalli64/jd
 */
package com.example.jd.s14.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

public class RegionDao implements Dao<Region> {
	private static final Logger log = LogManager.getLogger(RegionDao.class);

	private static final String GET_BY_PK = """
			SELECT region_id, name
			FROM region
			WHERE region_id = ?""";
	private static final String GET_ALL = """
			SELECT region_id, name
			FROM region
			""";
	private static final String INSERT = """
			INSERT INTO region (region_id, name) VALUES
			    (?, ?,)""";
	private static final String UPDATE_BY_ID = """
			UPDATE region
			SET name = ?
			WHERE region_id = ?""";
	private static final String DELETE = """
			DELETE FROM employee
			WHERE region_id = ?""";

	@Override
	public Optional<Region> get(long id) {
		try (Connection conn = Connector.getConnection(); //
				PreparedStatement ps = conn.prepareStatement(GET_BY_PK)) {
			ps.setLong(1, id);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					Region my = new Region(rs.getLong(1), rs.getString(2));
					return Optional.of(my);
				}
			}
		} catch (SQLException se) {
			log.error("Can't get coder " + id, se);
		}
		return Optional.empty();

	}

	@Override
	public List<Region> getAll() {
		List<Region> results = new ArrayList<>();

		try (Connection conn = Connector.getConnection();
				Statement stmt = conn.createStatement();
				ResultSet rs = stmt.executeQuery(GET_ALL)) {
			while (rs.next()) {
				Region region = new Region(rs.getLong(1), rs.getString(2));
				results.add(region);
			}
		} catch (SQLException se) {
			log.error("Can't get all coders", se);
		}

		return results;
	}

	@Override
	public void save(Region t) {
		try (Connection conn = Connector.getConnection(); //
				PreparedStatement ps = conn.prepareStatement(INSERT)) {
			ps.setLong(1, t.getId());
			ps.setString(2, t.getName());
			ps.executeUpdate();
		} catch (SQLException se) {
			log.error("Can't save region " + t.getId(), se);
		}

	}

	@Override
	public void update(Region t) {
		 try (Connection conn = Connector.getConnection(); //
	                PreparedStatement ps = conn.prepareStatement(UPDATE_BY_ID)) {
	            ps.setString(2, t.getName());
	            int count = ps.executeUpdate();
	            if (count != 1) {
	                log.warn("Updated " + count + " lines for " + t);
	            }
	        } catch (SQLException se) {
	            log.error("Can't update region " + t.getId(), se);
	        }
	}

	@Override
	public void delete(long id) {
		 try (Connection conn = Connector.getConnection(); //
	                PreparedStatement ps = conn.prepareStatement(DELETE)) {
	            ps.setLong(1, id);
	            int count = ps.executeUpdate();
	            if (count != 1) {
	                log.warn("Deleted " + count + " lines for " + id);
	            }
	        } catch (SQLException se) {
	            log.error("Can't delete region " + id, se);
	        }

	}

	public Region legacyGet(long id) {
		try (Connection conn = Connector.getConnection(); //
				PreparedStatement ps = conn.prepareStatement(GET_BY_PK)) {
			ps.setLong(1, id);
			try (ResultSet rs = ps.executeQuery()) {
				if (rs.next()) {
					 return new Region(rs.getLong(1), rs.getString(2));
	                }
				
				}
			}catch (SQLException se) {
			log.error("Can't get coder " + id, se);
		}

		return null;
	}
}
