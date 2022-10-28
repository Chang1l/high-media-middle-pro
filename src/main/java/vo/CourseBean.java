package vo;

import java.sql.Date;

public class CourseBean {
	
	private int C_NO;//강의번호
	private String C_TITLE;//강의제목
	private String P_NAME;//교수이름
	private String C_DATE;//개강일자
	private int C_VOL;//강의수
	private String C_CONTENT;//강의상세내용
	private String C_IMG;//강의이미지
	private String C_RESDATE;//등록날짜
	private String C_RESALTDATE;//수정날짜
	
	public int getC_NO() {
		return C_NO;
	}
	public void setC_NO(int c_no) {
		C_NO = c_no;
	}
	public String getC_TITLE() {
		return C_TITLE;
	}
	public void setC_TITLE(String c_title) {
		C_TITLE = c_title;
	}
	public String getP_NAME() {
		return P_NAME;
	}
	public void setP_NAME(String p_name) {
		P_NAME = p_name;
	}
	public String getC_DATE() {
		return C_DATE;
	}
	public void setC_DATE(String c_date) {
		C_DATE = c_date;
	}
	public int getC_VOL() {
		return C_VOL;
	}
	public void setC_VOL(int c_vol) {
		C_VOL = c_vol;
	}
	public String getC_CONTENT() {
		return C_CONTENT;
	}
	public void setC_CONTENT(String c_content) {
		C_CONTENT = c_content;
	}
	public String getC_IMG() {
		return C_IMG;
	}
	public void setC_IMG(String c_img) {
		C_IMG = c_img;
	}
	public String getC_RESDATE() {
		return C_RESDATE;
	}
	public void setC_RESDATE(String c_resdate) {
		C_RESDATE = c_resdate;
	}
	public String getC_RESALTDATE() {
		return C_RESALTDATE;
	}
	public void setC_RESALTDATE(String c_resaltdate) {
		C_RESALTDATE = c_resaltdate;
	}
	
	
}