package bean;

public class FinancialDonationBean {
	
	private int financial_donation_id;
	private int user_id;
	private double payment_amount;
	private String payment_date;
	private String payment_reference_number;
	private String payment_type;
	private String first_name;
	
	public String getFirst_name() {
		return first_name;
	}
	public void setFirst_name(String first_name) {
		this.first_name = first_name;
	}
	public String getPayment_type() {
		return payment_type;
	}
	public void setPayment_type(String payment_type) {
		this.payment_type = payment_type;
	}
	public int getFinancial_donation_id() {
		return financial_donation_id;
	}
	public void setFinancial_donation_id(int financial_donation_id) {
		this.financial_donation_id = financial_donation_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public double getPayment_amount() {
		return payment_amount;
	}
	public void setPayment_amount(double payment_amount) {
		this.payment_amount = payment_amount;
	}
	public String getPayment_date() {
		return payment_date;
	}
	public void setPayment_date(String payment_date) {
		this.payment_date = payment_date;
	}
	public String getPayment_reference_number() {
		return payment_reference_number;
	}
	public void setPayment_reference_number(String payment_reference_number) {
		this.payment_reference_number = payment_reference_number;
	}
	
	
	
	

}
