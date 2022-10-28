package vo;

public class ReviewBean {
	
	private int review_id;
	private String review_name;
	private String review_job;
	private String review_contents;
	private int review_count;
	private String m_id;
	private int all_review_id;
	
	
	public int getAll_review_id() {
		return all_review_id;
	}
	public void setAll_review_id(int all_review_id) {
		this.all_review_id = all_review_id;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public int getReview_count() {
		return review_count;
	}
	public void setReview_count(int review_count) {
		this.review_count = review_count;
	}
	public int getReview_id() {
		return review_id;
	}
	public void setReview_id(int review_id) {
		this.review_id = review_id;
	}
	public String getReview_name() {
		return review_name;
	}
	public void setReview_name(String review_name) {
		this.review_name = review_name;
	}
	public String getReview_job() {
		return review_job;
	}
	public void setReview_job(String review_job) {
		this.review_job = review_job;
	}
	public String getReview_contents() {
		return review_contents;
	}
	public void setReview_contents(String review_contents) {
		this.review_contents = review_contents;
	}

	
	
}
