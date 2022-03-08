package bean;

public class NonFinancialDonationBean {
	
	private int non_financial_donation_id;
	private int user_id;
	private String appointment_time;
	private String donation_desc;
	private String donation_date;
	private String first_name;
	
	
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public int getNon_financial_donation_id() {
		return non_financial_donation_id;
	}
	public void setNon_financial_donation_id(int non_financial_donation_id) {
		this.non_financial_donation_id = non_financial_donation_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getAppointment_time() {
		return appointment_time;
	}
	public void setAppointment_time(String appointment_time) {
		this.appointment_time = appointment_time;
	}
	
	public String getDonation_desc() {
		return donation_desc;
	}
	public void setDonation_desc(String donation_desc) {
		this.donation_desc = donation_desc;
	}
	public String getDonation_date() {
		return donation_date;
	}
	public void setDonation_date(String donation_date) {
		this.donation_date = donation_date;
	}
	
	
	
	
	
	

}
