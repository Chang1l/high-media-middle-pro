package vo;

import java.sql.Date;

public class BoardBean {
	
	private int B_NO;
	private String M_ID;
	private String B_SUBJECT;
	private String B_CONTENT;
	private String B_FILE;
	private int B_READCOUNT;
	private String B_DATE;
	public int getB_NO() {
		return B_NO;
	}
	public void setB_NO(int b_NO) {
		B_NO = b_NO;
	}
	public String getM_ID() {
		return M_ID;
	}
	public void setM_ID(String m_ID) {
		M_ID = m_ID;
	}
	public String getB_SUBJECT() {
		return B_SUBJECT;
	}
	public void setB_SUBJECT(String b_SUBJECT) {
		B_SUBJECT = b_SUBJECT;
	}
	public String getB_CONTENT() {
		return B_CONTENT;
	}
	public void setB_CONTENT(String b_CONTENT) {
		B_CONTENT = b_CONTENT;
	}
	public String getB_FILE() {
		return B_FILE;
	}
	public void setB_FILE(String b_FILE) {
		B_FILE = b_FILE;
	}
	public int getB_READCOUNT() {
		return B_READCOUNT;
	}
	public void setB_READCOUNT(int b_READCOUNT) {
		B_READCOUNT = b_READCOUNT;
	}
	public String getB_DATE() {
		return B_DATE;
	}
	public void setB_DATE(String b_DATE) {
		B_DATE = b_DATE;
	}
	
	
	
}