package master.utilities;

import java.sql.*;

public class ConnectionFactory {
	private Connection cn = null;
	
	public Connection getConn() {
		try {
			// Load the driver
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			// Get connection
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jobportal", "root", "1996");
		} catch (ClassNotFoundException ce) {
			ce.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		}
		
		return cn;
	}
}
