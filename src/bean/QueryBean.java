package bean;

public class QueryBean {

	private int query_id;
	private int user_id;
	private String query_text;
	private String query_type;
	private String query_ans;
	private String query_sub_date;
	private String query_ans_date;
	private String user_name;
	
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public int getQuery_id() {
		return query_id;
	}
	public void setQuery_id(int query_id) {
		this.query_id = query_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getQuery_text() {
		return query_text;
	}
	public void setQuery_text(String query_text) {
		this.query_text = query_text;
	}
	public String getQuery_type() {
		return query_type;
	}
	public void setQuery_type(String query_type) {
		this.query_type = query_type;
	}
	public String getQuery_ans() {
		return query_ans;
	}
	public void setQuery_ans(String query_ans) {
		this.query_ans = query_ans;
	}
	public String getQuery_sub_date() {
		return query_sub_date;
	}
	public void setQuery_sub_date(String query_sub_date) {
		this.query_sub_date = query_sub_date;
	}
	public String getQuery_ans_date() {
		return query_ans_date;
	}
	public void setQuery_ans_date(String query_ans_date) {
		this.query_ans_date = query_ans_date;
	}
	
}
