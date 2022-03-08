package bean;

public class Feedback {
	private int feedback_id;
	private int user_id;
    private String feedback_text;
   private String feedback_date;
   private String user_name;
   
public String getUser_name() {
	return user_name;
}
public void setUser_name(String user_name) {
	this.user_name = user_name;
}
public int getFeedback_id() {
	return feedback_id;
}
public void setFeedback_id(int feedback_id) {
	this.feedback_id = feedback_id;
}
public int getUser_id() {
	return user_id;
}
public void setUser_id(int user_id) {
	this.user_id = user_id;
}
public String getFeedback_text() {
	return feedback_text;
}
public void setFeedback_text(String feedback_text) {
	this.feedback_text = feedback_text;
}
public String getFeedback_date() {
	return feedback_date;
}
public void setFeedback_date(String feedback_date) {
	this.feedback_date = feedback_date;
}
   
}
