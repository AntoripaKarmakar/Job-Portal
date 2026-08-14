package master.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import master.dto.JobDto;
import master.utilities.ConnectionFactory;

public class JobDao {
	private Connection cn = null;
	private Statement st = null;
	private PreparedStatement ps = null;
	private ResultSet rs = null;
	
	// QUERIES
	private String insert_job = "INSERT INTO JOBS (TITLE, DESCRIPTION, LOCATION, COMPANY, SALARY, IS_REMOTE, UID) VALUES (?, ?, ?, ?, ?, ?, ?)";
	private String select_job = "SELECT * FROM JOBS";
	private String select_job_by_id = "SELECT * FROM JOBS WHERE JID = ?";
	private String select_job_by_user = "SELECT * FROM JOBS WHERE UID = ?";
	private String update_job_verif = "UPDATE JOBS SET IS_VERIFIED = TRUE WHERE JID = ?";
	private String delete_job = "DELETE FROM JOBS WHERE JID = ?";
	
	// METHODS
	// Add new job
	public int addJob(JobDto jdto) {
		int rows = 0;
		try {
			// Connect to DB
			ConnectionFactory con = new ConnectionFactory();
			cn = con.getConn();
			
			// Execute query
			ps = cn.prepareStatement(insert_job);
			ps.setString(1, jdto.getTitle());
			ps.setString(2, jdto.getDescription());
			ps.setString(3, jdto.getLocation());
			ps.setString(4, jdto.getCompany());
			ps.setInt(5,  jdto.getSalary());
			ps.setBoolean(6, jdto.isRemote());
			ps.setInt(7, jdto.getUid());
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
	
	// Get all jobs
	public List<JobDto> getJobs() {
		List<JobDto> jobs = new ArrayList<>();
		try {
			// Connect to DB
			ConnectionFactory con = new ConnectionFactory();
			cn = con.getConn();
			
			// Execute query
			ps = cn.prepareStatement(select_job);
			rs = ps.executeQuery();
			
			// Feed JobDto's to be returned
			while (rs.next()) {
				JobDto job = new JobDto();
				job.setJid(rs.getInt("jid"));
				job.setTitle(rs.getString("title"));
				job.setDescription(rs.getString("description"));
				job.setCompany(rs.getString("company"));
				job.setSalary(rs.getInt("salary"));
				job.setLocation(rs.getString("location"));
				job.setRemote(rs.getBoolean("is_remote"));
				job.setUid(rs.getInt("uid"));
				job.setVerified(rs.getBoolean("is_verified"));
				job.setPostedAt(rs.getTimestamp("posted_at"));
				
				jobs.add(job);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
	        try { if (rs != null) rs.close(); } catch (Exception e) {}
	        try { if (ps != null) ps.close(); } catch (Exception e) {}
	        try { if (cn != null) cn.close(); } catch (Exception e) {}
	    }
		
		return jobs;
	}
	
	// Get jobs by user (UID)
	public List<JobDto> getJobsByUser(int uid) {
		List<JobDto> jobs = new ArrayList<>();
		try {
			// Connect to DB
			ConnectionFactory con = new ConnectionFactory();
			cn = con.getConn();
			
			// Execute query
			ps = cn.prepareStatement(select_job_by_user);
			ps.setInt(1, uid);
			rs = ps.executeQuery();
			
			// Feed JobDto's to be returned
			while (rs.next()) {
				JobDto job = new JobDto();
				job.setJid(rs.getInt("jid"));
				job.setTitle(rs.getString("title"));
				job.setDescription(rs.getString("description"));
				job.setCompany(rs.getString("company"));
				job.setSalary(rs.getInt("salary"));
				job.setLocation(rs.getString("location"));
				job.setRemote(rs.getBoolean("is_remote"));
				job.setUid(rs.getInt("uid"));
				job.setVerified(rs.getBoolean("is_verified"));
				job.setPostedAt(rs.getTimestamp("posted_at"));
				
				jobs.add(job);
			}
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
	        try { if (rs != null) rs.close(); } catch (Exception e) {}
	        try { if (ps != null) ps.close(); } catch (Exception e) {}
	        try { if (cn != null) cn.close(); } catch (Exception e) {}
	    }
		
		return jobs;
	}
	
	// Get job by JID
	public JobDto getJobById(JobDto jdto) {
		JobDto job = null;
		try {
			// Connect to DB
			ConnectionFactory con = new ConnectionFactory();
			cn = con.getConn();
			
			// Execute query
			ps = cn.prepareStatement(select_job_by_id);
			ps.setInt(1,  jdto.getJid());
			rs = ps.executeQuery();
			
			// Feed JobDto to be returned
			if (rs.next()) {
				job = new JobDto();
				job.setJid(rs.getInt("jid"));
				job.setTitle(rs.getString("title"));
				job.setDescription(rs.getString("description"));
				job.setCompany(rs.getString("company"));
				job.setSalary(rs.getInt("salary"));
				job.setLocation(rs.getString("location"));
				job.setRemote(rs.getBoolean("is_remote"));
				job.setUid(rs.getInt("uid"));
				job.setVerified(rs.getBoolean("is_verified"));
				job.setPostedAt(rs.getTimestamp("posted_at"));
			}
			
		} catch (SQLException se) {
			se.printStackTrace();
		} finally {
	        try { if (rs != null) rs.close(); } catch (Exception e) {}
	        try { if (ps != null) ps.close(); } catch (Exception e) {}
	        try { if (cn != null) cn.close(); } catch (Exception e) {}
	    }
		
		return job;
	}
	
	// Set job as verified
	public int verifyJob(JobDto jdto) {
		int rows = 0;
		try {
			// Connect to DB
			ConnectionFactory con = new ConnectionFactory();
			cn = con.getConn();
			
			// Execute query
			ps = cn.prepareStatement(update_job_verif);
			ps.setInt(1, jdto.getJid());
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
	
	// Delete job
		public int deleteJob(JobDto jdto) {
			int rows = 0;
			try {
				// Connect to DB
				ConnectionFactory con = new ConnectionFactory();
				cn = con.getConn();
				
				// Execute query
				ps = cn.prepareStatement(delete_job);
				ps.setInt(1, jdto.getJid());
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
