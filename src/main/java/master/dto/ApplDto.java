package master.dto;

import java.sql.Timestamp;

public class ApplDto {
	private int aid;
	private int jid;
	private int uid;
	private String eduWorkDet;
	private int experience;
	private String coverLetter;
	private Timestamp appliedAt;
	
	public int getAid() {
		return aid;
	}
	public void setAid(int aid) {
		this.aid = aid;
	}
	public int getJid() {
		return jid;
	}
	public void setJid(int jid) {
		this.jid = jid;
	}
	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getEduWorkDet() {
		return eduWorkDet;
	}
	public void setEduWorkDet(String eduWorkDet) {
		this.eduWorkDet = eduWorkDet;
	}
	public int getExperience() {
		return experience;
	}
	public void setExperience(int experience) {
		this.experience = experience;
	}
	public String getCoverLetter() {
		return coverLetter;
	}
	public void setCoverLetter(String coverLetter) {
		this.coverLetter = coverLetter;
	}
	public Timestamp getAppliedAt() {
		return appliedAt;
	}
	public void setAppliedAt(Timestamp appliedAt) {
		this.appliedAt = appliedAt;
	}
}
