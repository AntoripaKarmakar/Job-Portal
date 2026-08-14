package master.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import master.dto.ApplDto;
import master.utilities.ConnectionFactory;

public class ApplDao {
	private Connection cn = null;
	private Statement st = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	// QUERIES
	private String insert_app = "INSERT INTO APPLICATIONS (JID, UID, EDU_WORK_DET, EXPERIENCE, COVER_LETTER) VALUES (?, ?, ?, ?, ?)";
	private String select_app_by_job = "SELECT * FROM APPLICATIONS WHERE JID = ?";
	private String select_app_by_user = "SELECT * FROM APPLICATIONS WHERE UID = ?";
	private String select_app_by_id = "SELECT * FROM APPLICATIONS WHERE AID = ?";
	private String delete_app = "DELETE FROM APPLICATIONS WHERE AID = ?";
	
	// METHODS
	// Apply for a job
	public int applyJob(ApplDto adto) {
		int rows = 0;
		try {
			// Connect to DB
			ConnectionFactory con = new ConnectionFactory();
			cn = con.getConn();
			
			// Execute query
			ps = cn.prepareStatement(insert_app);
			ps.setInt(1,  adto.getJid());
			ps.setInt(2,  adto.getUid());
			ps.setString(3,  adto.getEduWorkDet());
			ps.setInt(4,  adto.getExperience());
			ps.setString(5,  adto.getCoverLetter());
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
	
	// Get applications by job
	public List<ApplDto> getApplicationsByJob(int jid) {
		List<ApplDto> apps = new ArrayList<>();
		try {
			// Connect to DB
			ConnectionFactory con = new ConnectionFactory();
			cn = con.getConn();
			
			// Execute query
			ps = cn.prepareStatement(select_app_by_job);
			ps.setInt(1,  jid);
			rs = ps.executeQuery();
			
			// Feed ApplDto's that are to be returned
			while (rs.next()) {
				ApplDto app = new ApplDto();
				app.setAid(rs.getInt("aid"));
				app.setJid(rs.getInt("jid"));
				app.setUid(rs.getInt("uid"));
				app.setEduWorkDet(rs.getString("edu_work_det"));
				app.setExperience(rs.getInt("experience"));
				app.setCoverLetter(rs.getString("cover_letter"));
				app.setAppliedAt(rs.getTimestamp("applied_at"));
				
				apps.add(app);
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
	        try { if (rs != null) rs.close(); } catch (Exception e) {}
	        try { if (ps != null) ps.close(); } catch (Exception e) {}
	        try { if (cn != null) cn.close(); } catch (Exception e) {}
	    }
		
		return apps;
	}
	
	// Get applications by user
		public List<ApplDto> getApplicationsByUser(int uid) {
			List<ApplDto> apps = new ArrayList<>();
			try {
				// Connect to DB
				ConnectionFactory con = new ConnectionFactory();
				cn = con.getConn();
				
				// Execute query
				ps = cn.prepareStatement(select_app_by_user);
				ps.setInt(1,  uid);
				rs = ps.executeQuery();
				
				// Feed ApplDto's that are to be returned
				while (rs.next()) {
					ApplDto app = new ApplDto();
					app.setAid(rs.getInt("aid"));
					app.setJid(rs.getInt("jid"));
					app.setUid(rs.getInt("uid"));
					app.setEduWorkDet(rs.getString("edu_work_det"));
					app.setExperience(rs.getInt("experience"));
					app.setCoverLetter(rs.getString("cover_letter"));
					app.setAppliedAt(rs.getTimestamp("applied_at"));
					
					apps.add(app);
				}
				
			} catch (SQLException se) {
				se.printStackTrace();
			} finally {
		        try { if (rs != null) rs.close(); } catch (Exception e) {}
		        try { if (ps != null) ps.close(); } catch (Exception e) {}
		        try { if (cn != null) cn.close(); } catch (Exception e) {}
		    }
			
			return apps;
		}
		
		// Get application by AID
		public ApplDto getApplicationById(int aid) {
			ApplDto app = null;
			try {
				// Connect to DB
				ConnectionFactory con = new ConnectionFactory();
				cn = con.getConn();
				
				// Execute query
				ps = cn.prepareStatement(select_app_by_id);
				ps.setInt(1,  aid);
				rs = ps.executeQuery();
				
				// Feed ApplDto's that are to be returned
				if (rs.next()) {
					app = new ApplDto();
					app.setAid(rs.getInt("aid"));
					app.setJid(rs.getInt("jid"));
					app.setUid(rs.getInt("uid"));
					app.setEduWorkDet(rs.getString("edu_work_det"));
					app.setExperience(rs.getInt("experience"));
					app.setCoverLetter(rs.getString("cover_letter"));
					app.setAppliedAt(rs.getTimestamp("applied_at"));
				}
				
			} catch (SQLException se) {
				se.printStackTrace();
			} finally {
		        try { if (rs != null) rs.close(); } catch (Exception e) {}
		        try { if (ps != null) ps.close(); } catch (Exception e) {}
		        try { if (cn != null) cn.close(); } catch (Exception e) {}
		    }
			
			return app;
		}
		
		// Delete an application
		public int deleteApplication(int aid) {
			int rows = 0;
			try {
				// Connect to DB
				ConnectionFactory con = new ConnectionFactory();
				cn = con.getConn();
				
				// Execute query
				ps = cn.prepareStatement(delete_app);
				ps.setInt(1,  aid);
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
