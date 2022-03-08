package bean;

public class AdoptionBean {
	
	private int adoption_id;
	private int user_id;
	private int pet_id;
	private String appointment_time;
	private String adoption_date;
	private String pet_name;
	private String user_name;
	private String pet_category;
	private String pet_breed;
	private int age;
	private String health_details;
	
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getHealth_details() {
		return health_details;
	}
	public void setHealth_details(String health_details) {
		this.health_details = health_details;
	}
	public String getPet_category() {
		return pet_category;
	}
	public void setPet_category(String pet_category) {
		this.pet_category = pet_category;
	}
	public String getPet_breed() {
		return pet_breed;
	}
	public void setPet_breed(String pet_breed) {
		this.pet_breed = pet_breed;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public int getAdoption_id() {
		return adoption_id;
	}
	public void setAdoption_id(int adoption_id) {
		this.adoption_id = adoption_id;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public int getPet_id() {
		return pet_id;
	}
	public void setPet_id(int pet_id) {
		this.pet_id = pet_id;
	}
	public String getAppointment_time() {
		return appointment_time;
	}
	public void setAppointment_time(String appointment_time) {
		this.appointment_time = appointment_time;
	}
	public String getAdoption_date() {
		return adoption_date;
	}
	public void setAdoption_date(String adoption_date) {
		this.adoption_date = adoption_date;
	}

}
