package master.dao;

import java.sql.*;

import master.dto.UserDto;
import master.utilities.ConnectionFactory;

public class UserDao {
	private Connection cn = null;
	private Statement st = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	// QUERIES
	private String select_user = "SELECT * FROM USERS WHERE EMAIL = ? AND PASSWORD = ?";
	private String select_user_by_id = "SELECT * FROM USERS WHERE UID = ?";
	private String insert_user = "INSERT INTO USERS (NAME, EMAIL, PASSWORD, ROLE) VALUES (?, ?, ?, ?)";
	private String delete_user = "DELETE FROM USERS WHERE UID = ?";
	
	// METHODS
	// Get user details from email and password
	public UserDto getUser(String email, String password) {
		UserDto user = null;
		try {
			// Connect to DB
			ConnectionFactory con = new ConnectionFactory();
			cn = con.getConn();
			
			// Prepare and execute query
			ps = cn.prepareStatement(select_user);
			ps.setString(1, email);
			ps.setString(2, password);
			rs = ps.executeQuery();
			
			// Feed data into the UserDto to be returned
			if (rs.next()) {
				user = new UserDto();
				user.setUid(rs.getInt("uid"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
			}
			
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
	        try { if (rs != null) rs.close(); } catch (Exception e) {}
	        try { if (ps != null) ps.close(); } catch (Exception e) {}
	        try { if (cn != null) cn.close(); } catch (Exception e) {}
	    }
		
		return user;
	}
	
	// Get user details by UID
	public UserDto getUserById(UserDto udto) {
		UserDto user = null;
		try {
			// Connect to DB
			ConnectionFactory con = new ConnectionFactory();
			cn = con.getConn();
			
			// Prepare and execute query
			ps = cn.prepareStatement(select_user_by_id);
			ps.setInt(1, udto.getUid());
			rs = ps.executeQuery();
			
			// Feed data into the UserDto to be returned
			if (rs.next()) {
				user = new UserDto();
				user.setUid(rs.getInt("uid"));
				user.setName(rs.getString("name"));
				user.setEmail(rs.getString("email"));
				user.setPassword(rs.getString("password"));
				user.setPassword(rs.getString("role"));
			}
			
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
	        try { if (rs != null) rs.close(); } catch (Exception e) {}
	        try { if (ps != null) ps.close(); } catch (Exception e) {}
	        try { if (cn != null) cn.close(); } catch (Exception e) {}
	    }
		
		return user;
	}
	
	// Add new user (Signup)
	public int addUser(UserDto udto) {
		int rows = 0;
		try {
			// Connect to DB
			ConnectionFactory con = new ConnectionFactory();
			cn = con.getConn();
			
			// Execute query
			ps = cn.prepareStatement(insert_user);
			ps.setString(1,  udto.getName());
			ps.setString(2,  udto.getEmail());
			ps.setString(3,  udto.getPassword());
			ps.setString(4,  udto.getRole());
			rows = ps.executeUpdate();
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
	        try { if (rs != null) rs.close(); } catch (Exception e) {}
	        try { if (ps != null) ps.close(); } catch (Exception e) {}
	        try { if (cn != null) cn.close(); } catch (Exception e) {}
	    }
		
		return rows;
	}
	
	// Delete user
	public int deleteUser(UserDto udto) {
		int rows = 0;
		try {
			// Connect to DB
			ConnectionFactory con = new ConnectionFactory();
			cn = con.getConn();
			
			// Execute query
			ps = cn.prepareStatement(delete_user);
			ps.setInt(1, udto.getUid());
			rows = ps.executeUpdate();
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
	        try { if (rs != null) rs.close(); } catch (Exception e) {}
	        try { if (ps != null) ps.close(); } catch (Exception e) {}
	        try { if (cn != null) cn.close(); } catch (Exception e) {}
	    }
		
		return rows;
	}
}
